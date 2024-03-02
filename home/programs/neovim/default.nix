{ pkgs, config, ... }:

{
  #home.packages = with pkgs; [
    #neovim
  #];

  programs.neovim = {
    enable = true;
  };
}

