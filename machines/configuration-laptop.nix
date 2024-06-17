{ config, lib, pkgs, ... }:

{
  # Import general Configs
  imports = [ ./../hardware-configuration-laptop.nix ./../configuration.nix ];

  # Hostname
  networking.hostName = "eliasLaptop";
  hardware.pulseaudio.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  environment.systemPackages = with pkgs; [
    bluez
    bluez-tools
    gnome.networkmanager-vpnc
    networkmanagerapplet
  ];
  services.blueman.enable = true;
}
