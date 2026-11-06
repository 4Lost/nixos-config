{ pkgs, ... }:

{
  imports = [
    ./extras
    ./services
    ./themes
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
      pavucontrol

      cups
      firefox
      bitwarden-desktop

      # Sops
      age
      sops
    ];

    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-39.8.10" ];
  };
}
