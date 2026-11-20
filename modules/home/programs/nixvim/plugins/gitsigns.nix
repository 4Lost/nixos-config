{ ... }:

{
  flake.modules.homeManager.gitsigns =
    { ... }:

    {
      programs.nixvim.plugins.gitsigns = {
        enable = true;
        autoLoad = true;
      };
    };
}
