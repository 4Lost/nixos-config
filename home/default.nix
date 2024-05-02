{ config, pkgs, ... }:

{
  home = {
    username = "elias";
    homeDirectory = "/home/elias";
    packages = with pkgs; [
      # archives
      unzip
      zip
      fuse

      # misc
      tree
      which

      # system tools
      lm_sensors
      arandr
      pavucontrol
      sshfs

      obsidian
      lean4

      firefox
      bitwarden
    ];

    stateVersion = "23.11";
  };
  programs = { home-manager.enable = true; };

  home.file."git/minlog".source =
    config.lib.file.mkOutOfStoreSymlink "${pkgs.minlog}/share/minlog";

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-25.9.0" ];
  };
}
