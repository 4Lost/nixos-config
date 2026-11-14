{ pkgs, ... }:

{
  flake.modules.homeManager.inkscape =
    { ... }:

    {
      home.packages = with pkgs; [ inkscape ];
    };
}
