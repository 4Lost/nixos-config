{ ... }:

{
  flake.modules.homeManager.lualine =
    { ... }:

    {
      programs.nixvim.plugins.lualine = {
        enable = true;
        autoLoad = true;
      };
    };
}
