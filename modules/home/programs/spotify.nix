{ pkgs, ... }:

{
  flake.modules.homeManager.spotify =
    { ... }:

    {
      home.packages = with pkgs; [ spotify ];
    };
}
