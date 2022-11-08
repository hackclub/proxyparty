{ config, pkgs, lib, ... }:
let
  rules = import ../../rules.nix;

  acmeEmail = "team@hackclub.com";
  dnsProvider = "dnsimple";
  dnsCredentialsFile = "/var/secrets/acme_dns_credentials.env";
  proxyDomain = "proxyparty.hackclub.com"; # URL of this server
  domains = [
    "hackclub.com"
    "hack.af"
    "hackclub.org"
    "bulckcah.com"
    "hackclub.io"
    "hackedu.us"
    # "hackclub.us"
  ];

  # given a virtual host name, return the domain that matches
  #
  # ex. domainForHost 'foo.hackclub.com' -> 'hackclub.com'
  domainForHost = with lib;
    with builtins;
    host:
    findFirst (d: hasSuffix d host)
    (abort "Could not find matching domain for ${host}") domains;

  # from https://stackoverflow.com/a/54505212
  recursiveMerge = with lib;
    attrList:
    let
      f = attrPath:
        zipAttrsWith (n: values:
          if tail values == [ ] then
            head values
          else if all isList values then
            unique (concatLists values)
          else if all isAttrs values then
            f (attrPath ++ [ n ]) values
          else
            last values);
    in f [ ] attrList;

  rulesConfig = recursiveMerge (map (rule:
    if builtins.hasAttr "redirect" rule then {
      services.nginx.virtualHosts."${rule.redirect}" = {
        forceSSL = true;
        useACMEHost = domainForHost rule.redirect;

        locations."/".return = "302 ${rule.dest}${
            if rule ? "stripArgs" then "" else "$is_args$args"
          }";
      };
    } else if builtins.hasAttr "permRedirect" rule then {
      services.nginx.virtualHosts."${rule.permRedirect}" = {
        forceSSL = true;
        useACMEHost = domainForHost rule.permRedirect;

        locations."/".return = "302 ${rule.dest}${
            if rule ? "stripArgs" then "" else "$is_args$args"
          }";
      };
    } else if builtins.hasAttr "proxy" rule then {
      services.nginx.virtualHosts."${rule.proxy}" = {
        forceSSL = true;
        useACMEHost = domainForHost rule.proxy;

        locations."/" = {
          proxyPass = "${rule.dest}$request_uri";
          proxyWebsockets = true;

          extraConfig = ''
            # required per https://stackoverflow.com/a/22259088
            resolver 1.1.1.1;

            # required when the destination is also a TLS server with multiple hosts
            proxy_ssl_server_name on;
          '';
        };
      };
    } else
      abort "Can't find 'proxy', 'redirect', or 'permRedirect' in ${
        builtins.toJSON rule
      }") rules);
in recursiveMerge [
  {
    networking.firewall.allowedTCPPorts = [ 80 443 ];

    services.nginx = {
      enable = true;

      recommendedTlsSettings = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;

      # subdomain catch-alls for all domains
      virtualHosts = recursiveMerge [
        (with builtins;
          listToAttrs (map (domain: {
            name = "*.${domain}";
            value = {
              forceSSL = true;
              useACMEHost = domain;

              serverName =
                let escapedDomain = (replaceStrings [ "." ] [ "\\." ] domain);
                in "~^(?P<subdomain>.+\\.)${escapedDomain}$";

              locations."/".return = "302 https://hackclub.com";
            };
          }) domains))

        {
          "${proxyDomain}" = {
            default = true;

            locations."/".root = ./public;
          };
        }
      ];
    };

    users.users.nginx.extraGroups = [ "acme" ];

    # generate wildcard certificates for all the domains
    security.acme = {
      acceptTerms = true;
      email = acmeEmail;
      certs = builtins.listToAttrs (map (domain: {
        name = domain;
        value = {
          dnsProvider = dnsProvider;
          credentialsFile = dnsCredentialsFile;
          extraDomainNames = [ "*.${domain}" ]; # get wildcard certs
        };
      }) domains);
    };
  }
  rulesConfig
]
