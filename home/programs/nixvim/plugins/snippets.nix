{ ... }:

{
  programs.nixvim.plugins = {
    luasnip = {
      enable = true;
      autoLoad = true;

      fromVscode = [ { } ];
    };

    friendly-snippets = {
      enable = true;
      lazyLoad.enable = false;
    };
  };
}
