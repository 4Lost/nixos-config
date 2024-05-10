{ config, lib, pkgs, ... }:

{
  # Import general Configs
  imports = [ ./../hardware-configuration-laptop.nix ./../configuration.nix ];

  # Hostname
  networking.hostName = "eliasLaptop";
  hardware.pulseaudio.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };
  environment.systemPackages = with pkgs; [
    bluez
    bluez-alsa
    bluez-tools
    gnome.networkmanager-vpnc
    networkmanagerapplet
  ];
  hardware.pulseaudio.extraConfig = ''
    load-module module-bluetooth-policy
    load-module module-bluetooth-discover
  '';
  services.blueman.enable = true;
}
