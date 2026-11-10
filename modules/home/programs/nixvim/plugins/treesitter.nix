{ ... }:

{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      autoLoad = true;

      folding.enable = false;
      settings = {
        auto_install = false;
        highlight.enable = true;
      };
    };

    ts-context-commentstring = {
      enable = true;
      lazyLoad.enable = false;
    };
  };
}
