{ pkgs, ... }:

{
  imports = [ ./hardware-configuration-laptop.nix ./../configuration.nix ];

  networking.hostName = "eliasLaptop";
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  environment.systemPackages = with pkgs; [
    networkmanager-vpnc
    networkmanagerapplet
  ];
}
