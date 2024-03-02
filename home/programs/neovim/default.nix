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

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;

  plugins = with pkgs.vimPlugins; [
    # Plugin-Manager
    lazy-nvim

    # Theme
    catppuccin-nvim

    # Obsidian
    obsidian-nvim

    plenary-nvim
    telescope-nvim

    nvim-cmp

    nvim-treesitter.withAllGrammars
  ];

  extraLuaConfig = ''
    vim.g.mapleader = " "
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
        patterns = {"folke", "catppuccin", "epwalsh"},
      },
      install = {
        -- Safeguard in case we forget to install a plugin with Nix
        missing = false,
      },
    })
    require("config/options")
  '';
  };

  xdg.configFile."nvim/lua"= {
    recursive = true;
    source = ./lua;
  };
}

