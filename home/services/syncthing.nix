{ pkgs, ... }: {
  home.packages = with pkgs; [ stc-cli ];
  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
      command = "syncthingtray --wait";
    };
  };
}
