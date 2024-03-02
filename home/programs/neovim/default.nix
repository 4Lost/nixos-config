{ pkgs, config, ... }:

{
  home.sessionVariables = { EDITOR = "nvim"; };

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;

  plugins = with pkgs.vimPlugins; [
    lazy-nvim

    catppuccin-nvim
  ];

  extraLuaConfig = ''
    vim.g.mapleader = " "
    require("plugins")
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
        patterns = {"folke", "catppuccin"},
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

