{ ... }:

{
  flake.modules.homeManager.oil =
    { ... }:

    {
      programs.nixvim.plugins.oil = {
        enable = true;
        autoLoad = true;
      };
    };
}
