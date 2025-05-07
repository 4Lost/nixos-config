{ pkgs, ... }:

{
  imports = [ ./hardware-configuration-desktop.nix ./../configuration.nix ];

  networking.hostName = "eliasDesktop";
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  environment.systemPackages = with pkgs; [
    networkmanager-vpnc
    networkmanagerapplet
  ];
}
