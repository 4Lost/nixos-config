{ ... }:

{
  programs.nixvim.plugins.vim-css-color = {
    enable = true;
    lazyLoad.settings.filetypes = [ "css" ];
  };
}
