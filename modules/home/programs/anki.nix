{ ... }:

{
  flake.modules.homeManager.anki =
    { pkgs, ... }:

    {
      home.packages = with pkgs; [ anki ];
    };
}
