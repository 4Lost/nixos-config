{ ... }:

{
  flake.modules.homeManager.notify =
    { ... }:

    {
      programs.nixvim = {
        plugins.notify = {
          enable = true;
          autoLoad = true;

          settings.render = "wrapped-compact";
        };

        opts.termguicolors = true;
      };
    };
}
