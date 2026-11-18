{ ... }:

{
  flake.modules.homeManager.which-key =
    { ... }:

    {
      programs.nixvim.plugins.which-key = {
        enable = true;
        autoLoad = true;
      };
    };
}
