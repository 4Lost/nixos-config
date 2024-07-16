{ config, lib, pkgs, ... }:

{
  # Import general Configs
  imports = [ ./../hardware-configuration-desktop.nix ./../configuration.nix ];

  # Hostname
  networking.hostName = "eliasDesktop";
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  environment.systemPackages = with pkgs; [
    gnome.networkmanager-vpnc
    networkmanagerapplet
  ];
}
