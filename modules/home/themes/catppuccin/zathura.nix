{ ... }:

{
  flake.modules.homeManager.catppuccin-zathura =
    { ... }:

    {
      catppuccin.zathura.enable = true;
      programs.zathura.options.recolor = "false";
    };
}
