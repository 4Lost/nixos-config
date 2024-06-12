{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ stack ];
}
