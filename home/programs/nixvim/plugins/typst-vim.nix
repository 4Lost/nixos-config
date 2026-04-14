{ ... }:

# TODO: conceal does not work
{
  programs.nixvim.plugins.typst-vim = {
    enable = true;
    lazyLoad.settings.filetypes = [ "typst" ];

    settings = {
      conceal = 1;
      conceal_math = 1;
      conceal_emoji = 1;
    };
  };
}
