{ pkgs, ... }:

{
  imports = [
    # ./disko-desktop.nix
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
    networkmanagerapplet
  ];
}
