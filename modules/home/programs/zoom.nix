{ pkgs, ... }:

{
  flake.modules.homeManager.zoom =
    { ... }:

    {
      home.packages = with pkgs; [ zoom-us ];

      nixpkgs.config.allowUnfree = true;
    };
}
