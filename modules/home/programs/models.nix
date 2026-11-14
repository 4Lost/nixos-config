{ pkgs, ... }:

{
  flake.modules.homeManager.models =
    { ... }:

    {
      home.packages = with pkgs; [
        bambu-studio
        freecad
        gnumake
        openscad
        prusa-slicer
      ];
    };
}
