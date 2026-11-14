{ pkgs, ... }:

{
  flake.modules.homeManager.digikam =
    { ... }:

    {
      home.packages = with pkgs; [
        digikam
        sqlite
      ];
    };
}
