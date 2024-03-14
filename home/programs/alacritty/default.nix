{ pkgs, ... }:

let
  theme = builtins.fetchurl {
    url =
      "https://github.com/catppuccin/alacritty/ raw/main/catppuccin-mocha.toml";
    sha256 = "061yalrzpqivr67k2f8hsqixr77srgd8y47xvhp5vg0sjmh5lrcy";
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
        size = 9;
        normal.family = "Fira Code";
        bold.family = "Fira Code";
        italic.family = "Fira Code";
      };
    };
  };
}
