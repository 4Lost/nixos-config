{ pkgs, ... }:

{
  flake.modules.homeManager.skanlite =
    { ... }:

    {
      home.packages = with pkgs; [ kdePackages.skanlite ];
    };
}
