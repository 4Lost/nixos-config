{ config, lib, pkgs, ... }:

{
  # Include the results of the hardware scan.
  imports =
    [ ./hardware-configuration.nix ./home/programs/dropbox/default.nix ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Chose NetworkManager and hostname.
  networking = {
    hostName = "eliasLaptop";
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    # Use xkb.options in tty.
    useXkbConfig = true;
  };

  # Activate Flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services = {
    # Set XServer Options.
    xserver = {
      enable = true;
      displayManager = {
        sddm = {
          enable = true;
          theme = "catppuccin-mocha";
        };
        defaultSession = "none+xmonad";
      };
      libinput.enable = true; # Enable touchpad.
      windowManager.xmonad.enable = true;
      xkb.layout = "de";
    };
    # Enable CUPS to print.
    printing.enable = true;
    # For Samba support in Nautilus.
    gvfs.enable = true;
  };

  # Define a user account.
  users = {
    mutableUsers = false;
    users.elias = {
      isNormalUser = true;
      home = "/home/elias";
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "networkmanager" ];
      hashedPassword =
        "$6$pdAJt1f0v7Zb13Ri$1WpKrErAp5JCb7eXs7EeeWYRMBLu5/WKDdMyGzJyYQDijG2NiywUXpAkl/8p1noxOOqYbb.MTw7JmTzhWGsT21";
    };
  };

  # Basic Packages.
  environment.systemPackages = with pkgs; [
    (libsForQt5.callPackage ./home/themes/catppuccin-sddm.nix { })

    git
    wget
    curl
    alacritty
    dmenu

    acpilight # For setting Backlight.

    gnome.nautilus
    lxqt.lxqt-policykit # provides a default authentication client for policykit
  ];

  # permissions for acpilight
  services.udev = {
    enable = true;
    extraRules = ''
      SUBSYSTEM=="backlight", ACTION=="add", \
        RUN+="${pkgs.coreutils-full}/bin/chgrp video /sys/class/backlight/%k/brightness", \
        RUN+="${pkgs.coreutils-full}/bin/chmod g+w /sys/class/backlight/%k/brightness"
    '';
  };

  nixpkgs.config.allowUnfree = true;

  # Enable zsh for setting it as shell for users.
  programs.zsh.enable = true;

  # Audio
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Set stateVersion. Leave it as set.
  system.stateVersion = "23.11";
}

