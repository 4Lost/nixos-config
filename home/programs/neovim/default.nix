{ pkgs, config, ... }:

let
  deferred-clipboard-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "deferred-clipboard-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "EtiamNullam";
      repo = "deferred-clipboard.nvim";
      rev = "f58d9a20fe5d5891c61773814a1f3051ce43c006";
      hash = "sha256-HTk70Fb4n/F4nVkfxSKRsgrXnoFwMpSV276WvDt5uY0=";
    };
  };
  mkLuaConfig = file: args:
    builtins.readFile (pkgs.replaceVars file args);
in {
  home.sessionVariables = { EDITOR = "nvim"; };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    plugins = (with pkgs.vimPlugins; [
      catppuccin-nvim
      cmp-buffer
      cmp-conjure
      cmp-nvim-lua
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      conform-nvim
      conjure
      comment-nvim
      deferred-clipboard-nvim
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
      ruff
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
      nixfmt-rfc-style
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
      nerd-fonts.jetbrains-mono
      texliveFull
      clang-tools
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

