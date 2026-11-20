{ ... }:

{
  flake.modules.homeManager.games =
    { pkgs, ... }:

    {
      home.packages = with pkgs; [
        kdePackages.kbreakout
        prismlauncher
      ];
    };
}
