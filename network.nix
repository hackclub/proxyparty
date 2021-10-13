{
  network.description = "proxy deployment on Linode";

  "proxy" = { config, pkgs, lib, ... }: {
    deployment.targetUser = "root";
    deployment.targetHost = "45.79.164.46";

    imports = [ ./proxy/configuration.nix ];
  };
}
