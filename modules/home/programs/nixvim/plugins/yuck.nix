{ ... }:

{
  flake.modules.homeManager.yuck =
    { ... }:

    {
      programs.nixvim.plugins.yuck = {
        enable = true;
        lazyLoad.settings.filetypes = [ "yuck" ];
      };
    };
}
