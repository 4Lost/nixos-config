{ pkgs, ... }:

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
      gcc

      cups
      firefox
      bitwarden
    ];

    stateVersion = "23.11";
  };
  programs = { home-manager.enable = true; };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-32.3.3" ];
  };
}
