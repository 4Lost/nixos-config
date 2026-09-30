{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system/sops.nix
  ];

  # ── Use the systemd-boot EFI boot loader. ─────────────────────────────
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 120;
    };
    efi.canTouchEfiVariables = true;
  };

  # ── NetworkManager, timezone, internationalisation properties and ... ──
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-vpnc
    ];
  };
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  nix.settings = {
    download-buffer-size = 524288000;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # ── User account ──────────────────────────────────────────────────────
  users = {
    mutableUsers = false;
    users.elias = {
      isNormalUser = true;
      home = "/home/elias";
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      hashedPasswordFile = config.sops.secrets."user_password".path;
    };
  };

  networking.hostName = "eliasDesktop";

  environment.systemPackages = with pkgs; [
    networkmanager-vpnc
    networkmanagerapplet

    git
    wget
    curl
    alacritty
    dmenu
    sshfs
    dbus
    libnotify
  ];

  environment.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };

  system.stateVersion = "26.05";
}
