{ config, lib, pkgs, ... }:

{
  # Import general Configs
  imports = [ ./../configuration.nix ];

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
  services.blueman.enable = true;
}
