{ pkgs, config, ... }:

let
  obsidian-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "obsidian.nvim";
    version = "v3.5.1";
    src = pkgs.fetchFromGitHub {
      owner = "epwalsh";
      repo = "obsidian.nvim";
      rev = "4eb44381811ab6af67b9f9fe3117616afbe1e118";
      sha256 = "sha256-/zj12pwppb1RGi3EovXla6Ahzkoxh3qhxQFOfnfPwac=";
    };
    meta.homepage = "https://github.com/epwalsh/obsidian.nvim";
  };
in {
  home.sessionVariables = { EDITOR = "nvim"; };

  home.packages = with pkgs; [ nerdfonts texliveFull ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    withNodeJs = true;
    withPython3 = true;

    plugins = with pkgs.vimPlugins; [
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
      nvim-treesitter.withAllGrammars
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
      nodePackages.pyright
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

    extraLuaConfig = ''
      vim.g.mapleader = " "
      vim.g.maplocalleader = ","
      require("lazy").setup({
        spec = {
          -- Import plugins from lua/plugins
          { import = "plugins" },
        },
        performance = {
          reset_packpath = false,
          rtp = {
              reset = false,
            }
          },
        dev = {
          path = "${
            pkgs.vimUtils.packDir
            config.programs.neovim.finalPackage.passthru.packpathDirs
          }/pack/myNeovimPackages/start",
          patterns = {"arkav", "Bekaboo", "catppuccin", "epwalsh", "folke", "ggandor", "HiPhish", "hrsh7th", "iamcco", "Joosep", "Julian", "karb94", "kylechui", "L3MON4D3", "lervag", "mrcjkb", "neovim", "numToStr", "nvim-lua", "nvim-lualine", "nvim-telescope", "nvim-tree", "nvim-treesitter", "Olical", "onsails", "PaterJason", "rafamadiz", "saadparwaiz1", "skanehira", "stevearc", "tpope", "windwp"},
        },
        install = {
          -- Safeguard in case we forget to install a plugin with Nix
          missing = false,
        },
      })
      require("config/options")
    '';
  };

  xdg.configFile."nvim/lua" = {
    recursive = true;
    source = ./lua;
  };
}

