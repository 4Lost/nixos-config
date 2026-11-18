{ ... }:

{
  flake.modules.homeManager.skanlite =
    { pkgs, ... }:

    {
      home.packages = with pkgs; [ kdePackages.skanlite ];
    };
}
