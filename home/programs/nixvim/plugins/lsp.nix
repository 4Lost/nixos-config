{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    tofu-ls
    zuban
  ];

  programs.nixvim = {
    plugins.lsp.enable = true;

    lsp = {
      luaConfig = {
        post = ''
          vim.lsp.enable('tofu_ls')
          vim.lsp.enable('prolog_ls')
        '';
      };
      servers = {
        nixd = {
          enable = false;
        };
        rust_analyzer = {
          enable = true;
        };
        leanls = {
          enable = true;
        };
        nil_ls = {
          enable = !config.programs.nixvim.plugins.lsp.servers.nixd.enable;
          config = {
            nil = {
              formatting = {
                command = [
                  "nixfmt"
                ];
              };
              diagnostics = {
                ignored = [ ];
              };
              nix = {
                flake = {
                  autoArchive = true;
                };
              };
            };
          };
        };
        nushell = {
          enable = true;
        };
        pylsp = {
          enable = true;
        };
        pylyzer = {
          enable = false;
        };
        pyright = {
          enable = true;
        };
        clangd = {
          enable = true;
        };
        zk = {
          enable = true;
        };
        elixirls = {
          enable = true;
        };
        marksman = {
          enable = true;
        };
        texlab = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        ltex_plus = {
          enable = true;
          package = pkgs.ltex-ls-plus;
          config = {
            ltex = {
              language = "en-US";
              enabled = [
                "latex"
                "tex"
                "bibtex"
                "markdown"
                "typst"
                "quarto"
              ];
            };
          };
        };
        tinymist = {
          enable = true;
        };
      };
    };
  };
}
