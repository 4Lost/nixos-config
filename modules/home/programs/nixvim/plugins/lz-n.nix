{ ... }:

{
  flake.modules.homeManager.lz-n =
    { ... }:

    {
      programs.nixvim.plugins.lz-n = {
        enable = true;
      };
    };
}
