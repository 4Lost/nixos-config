{ pkgs, ... }:

{
  home.packages = with pkgs; [ dunst ];
  xdg.configFile."dunst/dunstrc" = {
    recursive = true;
    source = ./dunstrc;
  };
}
