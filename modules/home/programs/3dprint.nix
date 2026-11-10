{ pkgs, ... }:

{
  home.packages = with pkgs; [
    freecad
    gnumake
    openscad
    prusa-slicer
  ];
}
