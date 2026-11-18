{ ... }:

{
  flake.modules.homeManager.digikam =
    { pkgs, ... }:

    {
      home.packages = with pkgs; [
        digikam
        sqlite
      ];
    };
}
