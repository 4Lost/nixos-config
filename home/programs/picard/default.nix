{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ picard ];
}
