{ pkgs, ... }:

let
  theme = builtins.fetchurl {
    url =
      "https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml";
    sha256 = "1idjbm5jim9b36235hgwgp9ab81fmbij42y7h85l4l7cqcbyz74l";
  };
in {
  home.packages = with pkgs; [ fira-code alacritty-theme ];

  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        "TERM" = "xterm-256color";
        import = "${theme}";
      };
      font = {
        size = 7;
        normal.family = "Fira Code";
        bold.family = "Fira Code";
        italic.family = "Fira Code";
      };
    };
  };
}
