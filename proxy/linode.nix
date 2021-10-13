# These are recommended (needed?) configuration options when running NixOS on
# Linode. From https://www.linode.com/docs/guides/install-nixos-on-linode/.
{ pkgs, ... }: {
  networking.useDHCP = false;
  networking.interfaces.eth0.useDHCP = true;
  networking.interfaces.eth0.tempAddress =
    "disabled"; # needed for ipv6 to work on Linode, https://github.com/NixOS/nixpkgs/issues/71273#issuecomment-545442741

  networking.usePredictableInterfaceNames = false; # needed for linode

  environment.systemPackages = with pkgs; [ inetutils mtr sysstat ];
}
