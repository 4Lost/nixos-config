{ pkgs, ... }:

{
  # Importing necessary setup for Steam & Printing & Flutter.
  imports = [ ./builds/steam/default.nix ./home/extras/printer.nix ./builds/flutter.nix ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 120;
    };
    efi.canTouchEfiVariables = true;
  };

  # Chose NetworkManager, timezone, internationalisation properties and console settings.
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };
  # Enable Asterisks for Password prompt.
  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults pwfeedback
    '';
  };

  # Activate Flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configuration of the Garbage collect.
  nix.gc = {
    automatic = true; # Enable the automatic garbage collector
    dates = "10:00"; # When to run the garbage collector
    options = "--delete-older-than 7d";
  };

  services = {
    displayManager = {
      sddm = {
        enable = true;
        theme = "catppuccin-mocha";
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
    river.enable = true;
    ssh.startAgent = true;
    zsh.enable = true;
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

    git
    wget
    curl
    alacritty
    dmenu
    cmake
    cups

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

  # Betterlockscreen
  security.pam.services.i3lock.enable = true;

  # Enabling the Keyring.
  security.pam.services.lightdm.enableGnomeKeyring = true;
  services = {
    gnome.gnome-keyring.enable = true;
    # Disable powerbutton => for use with eww
    logind.extraConfig = ''HandlePowerKey=ignore'';
    # Setting the permissions for acpilight.
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

