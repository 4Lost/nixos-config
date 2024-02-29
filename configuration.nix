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
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

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
  services.xserver = {
    enable = true;
    displayManager = {
      sddm = {
        enable = true;
        theme = "sddm-sugar-dark";
      };
    };
  };
  #services.xserver = {
  #  displayManager = {
  #    sddm = {
  #      enable = true;
	#      theme = "sddm-sugar-dark";
  #    };
  #    defaultSession = "none+xmonad";
  #  };
   # xkb = {
  #    layout = "de";
  #  };
  #};


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
    mutableUsers = true;
    users.elias = {
      isNormalUser = true;
      home = "/home/elias";
      shell = pkgs.zsh;
      #openssh.authorizedKeys.keys = [
      #  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCTbgre6iWZWDtUJFgVPdzUvs1yTE1IkncPWgXz/5AQGT5ymlTxKQ7dqgjsjuioAM3ok1/Jg8oKX+5HPR3HGdrCwGi6iTVx8I6ojGZXPcqbus8G7UWIDwRJhH/Cx/qNkSFRdd1CK7BEUMTl1Ehgyl9kTbRgr2q1LaX/60qYUUfLi+h1YaC1jkNajN2d+tQnXUUBrauzd4LqDh9Lzh5GG1EARh0PAArzyL/URgFwUUu5RJapjo4yIKWaaG6Z2uUi2sQjtMbZRTYdWVdBHnzRnVJaS/Bc4nxIihtNcwJ/yeSEeRlpyXeX0UnsPK18Uif9jFdM6W4Ww90rinQjZkFIscFyRroflf11d1G4nTMLJIQU7LG0xqd6R50b68sX5qu9t8TI4j/E8PUqBFQ7YRI9y+tWZ36xgbqVcxyZt7IHI8UwzvC9PWxyMlzLBXCit95BQEwzMcQpgRe7BELPlOhnBErnaOXnXPUm5fWiNuNDSIP83VvaXBrTK4D8Fr/YMDxGlWIw3O0ZMwNMMDO4C56OraiWvNhPlxqtQfTkxbKaT613nPjgQWxoIeBK7ld4r8vqpY09Etao2vgP71twfHZMnc1rFK3oeAeWnd63SYOlMVJ3VfHjCo+BUl+rtitUfFfq54XDOxUDEnri7y0G7PwlyVzL9CEF/f3mRke7m21mxpT5/Q== elias.schroeter@e.email"
      #];
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
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

