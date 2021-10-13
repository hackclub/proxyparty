{
  network.description = "proxy deployment on Linode";

  "proxy" = { config, pkgs, lib, ... }: {
    deployment = {
      targetUser = "root";
      targetHost = "proxy.servers.hackclub.com";

      secrets = {
        "acme-dns-credentials" = {
          source = "./secrets/acme_dns_credentials.env";
          destination = "/var/secrets/acme_dns_credentials.env";
        };
      };
    };

    imports = [ ./proxy/configuration.nix ];
  };
}
