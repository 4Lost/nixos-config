{ inputs, pkgs, ... }:

{
  imports = [
    ./plugins
  ];

  programs.nixvim = {
    extraPackages = with pkgs; [
      texliveFull
      texlivePackages.standalone
      texlivePackages.relsize # needed for BA
      # papis-nvim
    ];
    extraConfigVim = ''
      filetype plugin on
      set nocompatible
      syntax on
    '';
  };
}
