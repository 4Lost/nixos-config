{ pkgs, ... }:

{
  home.packages = with pkgs; [ eww jq ];

  xdg.configFile."eww" = {
    recursive = true;
    source = ./src;
  };
}
