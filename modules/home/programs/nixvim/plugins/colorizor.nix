{ ... }:

{
  programs.nixvim.plugins.colorizer = {
    enable = true;
    lazyLoad.settings.filetypes = [
      "css"
      "scss"
      "less"
      "sass"
      "html"
      "svg"
    ];
  };
}
