{ pkgs, ... }:

{
  imports = [
    ./extras
    ./services
    ./themes
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

    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;

  # ── whatsie insecure ──────────────────────────────────────────────────
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-32.3.3"
      "qtwebengine-5.15.19"
    ];
  };
}
