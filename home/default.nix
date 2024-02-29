{ config, pkgs, ... }:

{
  imports = [
    ./programs
    ./services
  ];
  home = {
    username = "elias";
    homeDirectory = "/home/elias";
    packages = with pkgs; [
      # archives
      unzip
      zip

      # misc
      tree
      which

      # system tools
      lm_sensors

      # extras
      openssh
      betterbird
      bitwarden
      # dropbox
      firefox
      signal-desktop
      telegram-desktop
      xfce.thunar
      # zathura
      xfce.xfconf
    ];

    # environment.shells = [ pkgs.zsh ];
    # environment.variables.EDITOR = "nvim";
    # environment.pathsToLink = [ "/share/zsh" ];

    stateVersion = "23.11";
  };
  programs = {
    home-manager.enable = true;
    # thunar.enable = true;
    # xfconf.enable = true;
    # thunar.plugins = with pkgs.xfce; [
    #   thunar-archive-plugin
    #   thunar-volman
    # ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-25.9.0" ];
  };
  # services.gvfs.enable = true;
  # services.tumbler.enable = true;
}
