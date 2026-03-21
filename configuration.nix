{ pkgs, ... }:

let
  images = pkgs.callPackage ./home/themes/images.nix { };
in
{
  # ── Steam & Printer ───────────────────────────────────────────────────
  imports = [
    ./builds/steam/default.nix
    ./home/extras/printer.nix
  ];

  # ── Use the systemd-boot EFI boot loader. ─────────────────────────────
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 120;
    };
    efi.canTouchEfiVariables = true;
  };

  # ── NetworkManager, timezone, internationalisation properties and ─────
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

  # ── Enable Asterisks for Password prompt. ─────────────────────────────
  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults pwfeedback
    '';
  };

  nix = {
    # ── Flakes ────────────────────────────────────────────────────────────
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # ── Garbage collect ───────────────────────────────────────────────────
    gc = {
      automatic = true;
      dates = "12:00";
      options = "--delete-older-than 7d";
    };
  };

  services = {
    displayManager = {
      sddm = {
        enable = true;
        theme = "catppuccin-mocha-pink";
        wayland.enable = true;
      };
      #autoLogin = {
      #  enable = true;
      #  user = "elias";
      #};
      defaultSession = "river";
    };
    libinput.enable = true; # Enable touchpad.
    printing.enable = true;
  };

  programs = {
    river-classic.enable = true;
    ssh.startAgent = true;
    zsh.enable = true;
    fuse = {
      enable = true;
      userAllowOther = true;
    };
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
        "audio"
        "video"
        "render"
        "adbusers"
      ];
      hashedPassword = "$6$pdAJt1f0v7Zb13Ri$1WpKrErAp5JCb7eXs7EeeWYRMBLu5/WKDdMyGzJyYQDijG2NiywUXpAkl/8p1noxOOqYbb.MTw7JmTzhWGsT21";
    };
  };

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      accent = "pink";
      font = "Fira Code";
      fontSize = "9";
      background = "${images.lock}";
      loginBackground = true;
      userIcon = true;
    })
    exiftool

    git
    wget
    curl
    alacritty
    dmenu
    cmake
    cups
    exfatprogs
    exfat
    ntfs3g
    parted
    vpnc
    rcon-cli
    imv
    sshfs

    acpilight # For setting Backlight.
    dbus

    libnotify

    # For Saving the Auth of Nextcloud.
    seahorse
    libgnome-keyring

    # For setting the necessary permissions for gnome.nautilus.
    lxqt.lxqt-policykit # provides a default authentication client for policykit
  ];

  environment.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };

  # ── Keyring ───────────────────────────────────────────────────────────
  security.pam.services = {
    login.enableGnomeKeyring = true;
    sddm.enableGnomeKeyring = true;
  };

  services = {
    gnome = {
      gnome-keyring.enable = true;
      gcr-ssh-agent.enable = false;
    };

    # Disable powerbutton => for use with eww
    logind.settings.Login.HandlePowerKey = "ignore";
    # ── Permissions for acpilight ─────────────────────────────────────────
    udev = {
      enable = true;
      extraRules = ''
        SUBSYSTEM=="backlight", ACTION=="add", \
          RUN+="${pkgs.coreutils-full}/bin/chgrp video /sys/class/backlight/%k/brightness", \
          RUN+="${pkgs.coreutils-full}/bin/chmod g+w /sys/class/backlight/%k/brightness"
      '';
    };
    # Adding Features to Dolphin.
    gvfs.enable = true;
    udisks2.enable = true;
  };

  # Set stateVersion. Leave it as set.
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-32.3.3" ];
  };
  system.stateVersion = "23.11";
}
