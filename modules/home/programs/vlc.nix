{ pkgs, ... }:

{
  flake.modules.homeManager.vlc =
    { ... }:

    {
      home.packages = with pkgs; [ vlc ];
    };
}
