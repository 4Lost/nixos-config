{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    colorscheme = "catppuccin";
    colorschemes.catppuccin = {
      enable = true;
      settings = { flavour = "mocha"; };
    };
  };
}

