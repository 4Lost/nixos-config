{ pkgs, ... }:

{
  home.packages = with pkgs; [ fira-code alacritty-theme ];

  programs.alacritty = {
    enable = true;
    settings = {
      env = { "TERM" = "xterm-256color"; };

      font = {
        size = 9;
        normal.family = "Fira Code";
        bold.family = "Fira Code";
        italic.family = "Fira Code";
      };
    };
  };
}
