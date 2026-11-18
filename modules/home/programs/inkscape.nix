{ ... }:

{
  flake.modules.homeManager.inkscape =
    { pkgs, ... }:

    {
      home.packages = with pkgs; [ inkscape ];
    };
}
