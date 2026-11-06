{ pkgs, ... }: {
  home.packages = with pkgs; [ stc-cli ];
  services.syncthing = {
    enable = true;
  };
}
