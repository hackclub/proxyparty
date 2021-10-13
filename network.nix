{
  network.description = "proxy deployment on Linode";

  "proxy" = { config, pkgs, lib, ... }: {
    deployment.targetUser = "root";
    deployment.targetHost = "proxy.servers.hackclub.com";

    imports = [ ./proxy/configuration.nix ];
  };
}
