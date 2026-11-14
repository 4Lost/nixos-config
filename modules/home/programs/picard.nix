{ pkgs, ... }:

{
  flake.modules.homeManager.picard =
    { ... }:

    {
      home.packages = with pkgs; [ picard ];
    };
}
