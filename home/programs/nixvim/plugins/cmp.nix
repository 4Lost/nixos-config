{ ... }:

{
  programs.nixvim = {
    plugins = {
      blink-cmp = {
        enable = true;
        settings = {
          keymap = {
            preset = "default";
          };
          snippets = {
            preset = "luasnip";
          };
          completion = {
            accept = {
              auto_brackets = {
                enabled = true;
                kind_resolution = {
                  enabled = true;
                };
                semantic_token_resolution = {
                  enabled = true;
                  timeout_ms = 400;
                };
              };
            };
          };
          sources = {
            per_filetype = {
              yaml = [ "papis" ];
            };
            providers = {
              spell = {
                module = "blink-cmp-spell";
                name = "Spell";
                score_offset = 100;
                opts = { };
              };
              vimtex = {
                name = "vimtex";
                module = "blink.compat.source";
              };
              dap = {
                name = "dap";
                module = "blink.compat.source";
              };
              mkdnflow = {
                name = "mkdnflow";
                module = "blink.compat.source";
              };
            };
            default = [
              "lsp"
              "mkdnflow"
              "path"
              "snippets"
              # "dap"
              "vimtex"
              "buffer"
              "spell"
            ];
          };
        };
      };
      blink-cmp-spell.enable = true;
      blink-compat.enable = true;
      cmp-vimtex.enable = true;
      # cmp-dap.enable = true;
    };
  };
}

