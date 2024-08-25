{ config, lib, pkgs, ... }:

{
  # Import general Configs
  imports = [ ./../hardware-configuration-desktop.nix ./../configuration.nix ];

  # Hostname
  networking.hostName = "eliasDesktop";

  environment.systemPackages = with pkgs; [
    gnome.networkmanager-vpnc
    networkmanagerapplet
  ];
}
