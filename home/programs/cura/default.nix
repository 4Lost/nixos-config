{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ cura ];
}
