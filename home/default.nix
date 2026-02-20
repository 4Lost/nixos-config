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
      pavucontrol
      sshfs

      cups
      firefox
      bitwarden-desktop
    ];

    stateVersion = "23.11";
  };

  systemd.user.services = {
    idle-inhibitor = {
      Unit = {
        Description = "Presentation Mode";
      };
      Service = {
        Type = "simple";
        ExecStart = "systemd-inhibit --what=idle --who=Caffeine --why=Caffeine --mode=block sleep inf";
      };
    };
  };
  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-32.3.3" ];
  };
}
