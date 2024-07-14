{ pkgs, config, ... }:

let
  mkLuaConfig = file: args:
    builtins.readFile "${pkgs.substituteAll (args // { src = file; })}";
in {
  home.sessionVariables = { EDITOR = "nvim"; };

  home.packages = with pkgs; [ nerdfonts texliveFull ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;

    plugins = (with pkgs.vimPlugins; [
      bufferline-nvim
      catppuccin-nvim
      cmp-buffer
      cmp-conjure
      cmp-nvim-lua
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      comment-nvim
      conform-nvim
      conjure
      dropbar-nvim
      friendly-snippets
      lazy-nvim
      lean-nvim
      leap-nvim
      lspkind-nvim
      lualine-lsp-progress
      lualine-nvim
      luasnip
      markdown-preview-nvim
      neoconf-nvim
      neodev-nvim
      neoscroll-nvim
      nvim-autopairs
      nvim-cmp
      nvim-lspconfig
      nvim-surround
      nvim-tree-lua
      nvim-treesitter-textobjects
      nvim-ts-context-commentstring
      nvim-web-devicons
      obsidian-nvim
      oil-nvim
      plenary-nvim
      rainbow-delimiters-nvim
      telescope-fzf-native-nvim
      telescope-nvim
      vimtex
      which-key-nvim
    ]) ++ [
      (pkgs.vimPlugins.nvim-treesitter.withPlugins
        (plugins: pkgs.tree-sitter.allGrammars))
    ];

    extraPackages = with pkgs; [
      ripgrep
      fd
      codespell
      prettierd
      # Lua
      lua-language-server
      stylua
      # Haskell
      haskell-language-server
      ghc
      stack
      cabal-install
      haskellPackages.fourmolu
      # Lean
      lean
      # Python
      ruff-lsp
      pyright
      isort
      python311Packages.autopep8
      # LaTeX
      texlab
      xdotool
      pplatex
      neovim-remote
      # Nix
      nixd
      nixfmt
      # Rust
      rust-analyzer
      # Bash
      nodePackages.bash-language-server
      shellcheck
      shellharden
      # sh
      shfmt
      # Scheme
      chez
    ];

    extraLuaConfig = mkLuaConfig ./init.lua {
      path = "${pkgs.vimUtils.packDir
        config.programs.neovim.finalPackage.passthru.packpathDirs}";
    };
  };

  xdg.configFile."nvim/lua" = {
    recursive = true;
    source = ./lua;
  };
}

