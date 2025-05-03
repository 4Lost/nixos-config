{ pkgs, ... }:

{
  # Flutter
  programs = { adb.enable = true; };

  # SSH
  programs.ssh.startAgent = true;

  system.userActivationScripts = {
    stdio = {
      text = ''
        rm -f ~/Android/Sdk/platform-tools/adb
        ln -s /run/current-system/sw/bin/adb ~/Android/Sdk/platform-tools/adb
      '';
      deps = [ ];
    };
  };

  # Importing necessary setup for Steam & Printing & Flutter.
  imports = [ ./builds/steam/default.nix ./home/extras/printer.nix ./builds/flutter.nix ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Chose NetworkManager, timezone, internationalisation properties and console settings.
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    # Use xkb.options in tty.
    useXkbConfig = true;
  };
  # Enable Asterisks for Password prompt.
  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults pwfeedback
    '';
  };

  # Configuration of the Garbage collect.
  nix.gc = {
    automatic = true; # Enable the automatic garbage collector
    dates = "10:00"; # When to run the garbage collector
    options = "--delete-older-than 7d";
  };

  # Activate Flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services = {
    # Set XServer Options.
    displayManager = {
      sddm = {
        enable = true;
        theme = "catppuccin-mocha";
      };
      defaultSession = "none+xmonad";
    };
    libinput.enable = true; # Enable touchpad.
    xserver = {
      enable = true;
      windowManager.xmonad = {
        enable = true;
        flake = {
          enable = true;
          compiler = "ghc982";
        };
        enableContribAndExtras = true;
      };
      xkb = {
        layout = "de";
        options = "caps:deadgraveacute";
      };
    };
    # Enable CUPS to print.
    printing.enable = true;
  };

  # Define a user account.
  users = {
    mutableUsers = false;
    users.elias = {
      isNormalUser = true;
      home = "/home/elias";
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "networkmanager" "audio" "video" "adbusers" ];
      hashedPassword =
        "$6$pdAJt1f0v7Zb13Ri$1WpKrErAp5JCb7eXs7EeeWYRMBLu5/WKDdMyGzJyYQDijG2NiywUXpAkl/8p1noxOOqYbb.MTw7JmTzhWGsT21";
    };
  };

  # Setting the Basic Packages.
  environment.systemPackages = with pkgs; [
    (libsForQt5.callPackage ./home/themes/catppuccin-sddm.nix { })
    # flutter
    android-studio
    clang
    cmake
    flutter
    ninja
    pkg-config
    curl
    unzip
    xz
    sqlite
    sqlite-utils
    zip
    mesa
    dart

    git
    wget
    curl
    alacritty
    dmenu
    cmake
    cups

    acpilight # For setting Backlight.
    dbus
    pulseaudioFull
    pulseaudio-ctl

    libnotify

    # For Saving the Auth of Nextcloud.
    seahorse
    libgnome-keyring

    acpid

    # For setting the necessary permissions for gnome.nautilus.
    lxqt.lxqt-policykit # provides a default authentication client for policykit
  ];

  # Adding Features to Dolphin.
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  environment.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };

  # Setting the permissions for acpilight.
  services.udev = {
    enable = true;
    extraRules = ''
      SUBSYSTEM=="backlight", ACTION=="add", \
        RUN+="${pkgs.coreutils-full}/bin/chgrp video /sys/class/backlight/%k/brightness", \
        RUN+="${pkgs.coreutils-full}/bin/chmod g+w /sys/class/backlight/%k/brightness"
    '';
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-32.3.3" ];
  };

  # Virtualbox
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];
  boot.kernelModules = ["kvm-amd"];
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" "kv" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.host.enableKvm = true;
  virtualisation.virtualbox.host.addNetworkInterface = false;

  # Enable zsh for setting it as shell for users.
  programs.zsh.enable = true;

  # Enabling the Keyring.
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.lightdm.enableGnomeKeyring = true;

  # Disable powerbutton => for use with eww
  services.logind.extraConfig = ''HandlePowerKey=ignore'';
  services.acpid.enable = true;

  # Set stateVersion. Leave it as set.
  system.stateVersion = "23.11";
}

