{ pkgs, ... }:

{
  flake.modules.homeManager.games =
    { ... }:

    {
      home.packages = with pkgs; [
        kdePackages.kbreakout
        prismnlauncher
        jdk21
      ];
    };
}
