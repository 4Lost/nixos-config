{ ... }:

{
  programs.nixvim = {
    colorscheme = "catppuccin";
    colorschemes.catppuccin = {
      #lazyLoad.enable = true;
      enable = true;
      flavour = "mocha";
      accents = "pink";
      settings = {
        integrations = {
          markdown = true;
          leap = true;
          dap = true;
          dap_ui = true;
          lsp_trouble = true;
          blink_cmp = true;
          gitsigns = true;
          diffview = true;
          treesitter = true;
          barbar = true;
          telescope = true;
          native_lsp = {
            enabled = true;
            virtual_text = {
              errors = [ "italic" ];
              hints = [ "italic" ];
              warnings = [ "italic" ];
              information = [ "italic" ];
              ok = [ "italic" ];
            };
            underlines = {
              errors = [ "underline" ];
              hints = [ "underline" ];
              warnings = [ "underline" ];
              information = [ "underline" ];
              ok = [ "underline" ];
            };
            inlay_hints.background = true;
          };
          lsp_saga = true;
        };
      };
    };
    plugins.lualine.settings.theme = "catppuccin";
  };
}
