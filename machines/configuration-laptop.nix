{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration-laptop.nix
    ./../configuration.nix
  ];

  networking.hostName = "eliasLaptop";

  # ── Fingerprint ───────────────────────────────────────────────────────
  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix;
    };
  };

  # ── Bluetooth ─────────────────────────────────────────────────────────
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # ── Network ───────────────────────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    networkmanager-vpnc
    networkmanagerapplet
  ];
}
