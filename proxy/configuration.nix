{ pkgs, lib, ... }: {
  imports = [
    ./hardware-configuration.nix

    ./linode.nix # there are some networking config items in here

    # Services
    ./nginx
  ];

  boot.cleanTmpDir = true;

  networking.hostName = "proxy";
  networking.firewall.allowPing = true;

  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys =
    lib.flatten (builtins.attrValues (import ../ssh_keys.nix));
}
