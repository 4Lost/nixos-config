{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration-desktop.nix
    ./../configuration.nix
  ];

  networking.hostName = "eliasDesktop";

  # ── Hyprlock ──────────────────────────────────────────────────────────
  security.pam.services.hyprlock = { };

  # ── Bluetooth ─────────────────────────────────────────────────────────
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  # ── Network ───────────────────────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    networkmanager-vpnc
    networkmanagerapplet
  ];
}
