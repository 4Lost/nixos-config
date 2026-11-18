{ ... }:

{
  flake.modules.homeManager.otter =
    { ... }:

    {
      programs.nixvim.plugins.otter = {
        enable = true;
        autoLoad = true;
      };
    };
}
