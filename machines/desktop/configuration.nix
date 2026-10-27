{ pkgs, ... }:

{
  imports = [
    ./disko-desktop.nix
    ./../impermanence.nix
    ./../home-mounts.nix
    ./hardware-configuration.nix
    ./../../configuration.nix
  ];

  networking.hostName = "eliasDesktop";

  fileSystems."/".neededForBoot = true;
  fileSystems."/persist".neededForBoot = true;
  fileSystems."/nix".neededForBoot = true;
  fileSystems."/home".neededForBoot = true;

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
