{ pkgs, ... }:

{
  flake.modules.homeManager.anki =
    { ... }:

    {
      home.packages = with pkgs; [ anki ];
    };
}
