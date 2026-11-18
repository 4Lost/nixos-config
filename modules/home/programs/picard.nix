{ ... }:

{
  flake.modules.homeManager.picard =
    { pkgs, ... }:

    {
      home.packages = with pkgs; [ picard ];
    };
}
