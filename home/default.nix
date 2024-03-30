{ config, pkgs, ... }:

{
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
      arandr
      pavucontrol
      sshf
      sshfss

      obsidian
      lean4

      firefox
      bitwarden
    ];

    stateVersion = "23.11";
  };
  programs = { home-manager.enable = true; };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-25.9.0" ];
  };
}
