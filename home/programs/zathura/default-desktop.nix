{ ... }:

let
  theme = builtins.fetchurl {
    url =
      "https://raw.githubusercontent.com/catppuccin/zathura/main/src/catppuccin-mocha";
    sha256 = "0r2bgh4y7hymq8hhsjc70aw7yw85v668vgqcrcmdsggvdsk4rv1w";
  };
in {
  programs.zathura = {
    enable = true;
    options = {
      synctex-editor-command = ''
        include ${theme}
        nvim --headless -c "VimtexInverseSearch %l '%f'"
      '';
      synctex = true;
      font = "Fira Code 16";
    };
  };
}
