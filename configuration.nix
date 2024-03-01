# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    #(callPackage ./pkgs/sddm-sugar-dark-theme.nix { })

    git
    neovim
    wget
    curl
    alacritty
    dmenu
  ];

  networking.hostName = "eliasLaptop"; # Define your hostname.
  # Pick only one of the below networking options.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  #services.xserver = {
  #  enable = true;
    #displayManager = {
    #  sddm = {
    #    enable = true;
    #    theme = "sddm-sugar-dark";
    #  };
    #  defaultSession = "none+xmonad";
    #};
  #};
  services.xserver = {
    enable = true;
    displayManager = {
      sddm = {
        enable = true;
	      theme = "sddm-sugar-dark";
      };
      defaultSession = "none+xmonad";
    };
    windowManager.xmonad = {
      enable = true;
    };
    xkb = {
      layout = "de";
    };
  };


  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    mutableUsers = false;
    users.elias = {
      isNormalUser = true;
      home = "/home/elias";
      shell = pkgs.zsh;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      hashedPassword = "$6$pdAJt1f0v7Zb13Ri$1WpKrErAp5JCb7eXs7EeeWYRMBLu5/WKDdMyGzJyYQDijG2NiywUXpAkl/8p1noxOOqYbb.MTw7JmTzhWGsT21";
    };
  };

  programs.zsh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  system.stateVersion = "23.11"; # Did you read the comment?
}

