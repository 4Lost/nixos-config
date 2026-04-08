{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins
  ];

  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [ # TODO:
      texliveFull
      texlivePackages.standalone
      texlivePackages.relsize # needed for BA
      # papis-nvim
    ];

    nixpkgs.useGlobalPackages = false;

    clipboard.providers.wl-copy.enable = true;
    keymaps = [
      {
        key = "Y";
        action = ''"+y'';
        options.silent = true;
      }
      {
        key = "P";
        action = ''"+p'';
        options.silent = true;
      }
    ];

    viAlias = true;
    vimAlias = true;

    lualoader.enable = true;

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
