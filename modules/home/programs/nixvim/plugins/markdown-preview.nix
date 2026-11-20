{ ... }:

{
  flake.modules.homeManager.markdown-preview =
    { ... }:

    {
      programs.nixvim.plugins.markdown-preview = {
        enable = true;
        lazyLoad.settings.filetypes = [ "md" ];
      };
    };
}
