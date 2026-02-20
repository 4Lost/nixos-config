{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    nixpkgs.useGlobalPackages = false;

    clipboard = {
      providers = {
        wl-copy.enable = true;
      };
    };

    viAlias = true;
    vimAlias = true;

    lualoader.enable = true;

    extraPackages = with pkgs; [
      texliveFull
      texlivePackages.standalone
      # papis-nvim
    ]
    ;
    extraConfigVim = ''
      filetype plugin on
      set nocompatible
      syntax on
    '';

    colorscheme = "catppuccin";
    colorschemes.catppuccin = {
      #lazyLoad.enable = true;
      enable = true;
      flavour = "mocha";
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
            inlay_hints = {
              background = true;
            };
          };
          lsp_saga = true;
        };
      };
    };

    globals = {
      mapleader = " ";
      maplocalleader = ",";
    };

    opts = {
      cursorline = true; # Enable highlighting of the current line
      expandtab = true; # Use spaces instead of tabs
      list = true; # Show some invisible characters (tabs...)
      mouse = "a"; # Enable mouse mode
      number = true; # Print line number
      relativenumber = true; # Relative line numbers
      shiftround = true; # Round indent
      shiftwidth = 2; # Size of an indent
      smartindent = true; # Insert indents automatically
      spelllang = [ "en" ];
      tabstop = 2; # Number of spaces tabs count for
    };
  };
}
