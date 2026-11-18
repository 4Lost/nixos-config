{ ... }:

{
  flake.modules.homeManager.web-devicons =
    { ... }:

    {
      programs.nixvim.plugins.web-devicons = {
        enable = true;
        autoLoad = true;
      };
    };
}
