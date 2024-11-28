{ pkgs, ... }:

{
  home.packages = with pkgs; [ eww ];

  xdg.configFile."eww" = {
    recursive = true;
    source = ./src;
  };
}
