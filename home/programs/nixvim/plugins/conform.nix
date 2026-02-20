{ pkgs, ... }:

{
  home.packages = with pkgs; [
    stylua
    rustfmt
    fourmolu
    shellcheck
    shellharden
    shfmt
    black
    beamMinimal28Packages.elixir
    clang-tools
    prettierd
    nixfmt-rfc-style
    tex-fmt
    hclfmt
    topiary # TODO: Install https://github.com/blindFS/topiary-nushell somehow, e.g. clone languages.ncl to ~/.config/topiary/languages.ncl & nu.scm to ~/.config/topiary/topiary-queries/queries/nu.scm
  ];

  programs.nixvim.plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          lua = [ "stylua" ];
          rust = [ "rustfmt" ];
          python = [
            "black"
          ];
          haskell = [ "fourmolu" ];
          terraform = [ "hcl" ];
          elixir = [ "mix" ];
          bash = [
            "shellcheck"
            "shellharden"
            "shfmt"
          ];
          sh = [
            "shellcheck"
            "shfmt"
          ];
          c = [ "clang-format" ];
          cpp = [ "clang-format" ];
          markdown = [ "prettierd" ];
          json = [ "prettierd" ];
          yaml = [ "prettierd" ];
          nu = [ "topiary_nu" ];
          nix = [ "nixfmt" ];
          tex = [
            "tex-fmt"
          ];
          "_" = [
            "squeeze_blanks"
            "trim_whitespace"
            "trim_newlines"
          ];
        };
        format_on_save = # Lua
          ''
            function(bufnr)
              if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
              end

              return { lsp_fallback = true }
             end
          '';
        format_after_save = # Lua
          ''
            function(bufnr)
              if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
              end

              return { lsp_fallback = true }
            end
          '';
        formatters = {
          topiary_nu = {
            command = "topiary";
            args = [
              "format"
              "--language"
              "nu"
            ];
          };
          stylua = {
            "inherit" = true;
            prepend_args = [
              "--indent-type"
              "Spaces"
              "--indent-width"
              "2"
            ];
          };
          tex-fmt = {
            command = "tex-fmt";
          };
        };
      };
    };
  };

  programs.nixvim.userCommands = {
    FormatDisable = {
      bang = true;
      desc = "Disable autoformat-on-save";
      command.__raw = # Lua
        ''
          function(args)
            if args.bang then
              -- FormatDisable! will disable formatting just for this buffer
              vim.b.disable_autoformat = true
            else
              vim.g.disable_autoformat = true
            end
          end
        '';
    };
    FormatEnable = {
      desc = "Re-enable autoformat-on-save";
      command.__raw = # Lua
        ''
          function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
          end
        '';
    };
  };
}

