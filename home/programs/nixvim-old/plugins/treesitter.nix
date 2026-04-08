{ ... }:

{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      folding.enable = false;
      settings = {
        auto_install = false;
        highlight.enable = true;
      };
    };

    ts-context-commentstring = {
      enable = true;
    };
  };
}
