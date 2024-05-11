{ pkgs, ... }:

let
  theme = builtins.fetchurl {
    url =
      "https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml";
    sha256 = "1rnc6gsqjdvkb6xbv1pnawrp6f0j5770dqml2di90j3lhv0fppgw";
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
