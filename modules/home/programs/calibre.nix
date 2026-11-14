{ pkgs, ... }:

{
  flake.modules.homeManager.calibre =
    { ... }:

    {
      home.packages = with pkgs; [ calibre ];
    };
}
