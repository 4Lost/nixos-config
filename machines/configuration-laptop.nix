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

  # Hyprlock
  security.pam.services = {
    hyprlock = {
      text = ''
        auth sufficient pam_fprint.so
        auth include login
      '';
    };
    sudo.fprintAuth = true;
    login.fprintAuth = true;
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
