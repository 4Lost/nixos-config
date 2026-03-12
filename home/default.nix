{ pkgs, ... }:

{
  imports = [
    ./services
  ];

  # home.persistence."/persistent" = {
  #   directories = [
  #     "Downloads"
  #     "Pictures"
  #     "Documents"
  #     {
  #       directory = ".gnupg";
  #       mode = "0700";
  #     }
  #     {
  #       directory = ".ssh";
  #       mode = "0700";
  #     }
  #     {
  #       directory = ".local/share/keyrings";
  #       mode = "0700";
  #     }
  #   ];
  # };
  #
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
      pavucontrol
      sshfs

      cups
      firefox
      bitwarden-desktop
    ];

    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-32.3.3" ];
  };
}
