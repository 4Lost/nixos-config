{ ... }:

let
  theme = builtins.fetchurl {
    url =
      "https://raw.githubusercontent.com/catppuccin/zathura/main/src/catppuccin-mocha";
    sha256 = "1zhx3bfz5s2wjrj87w0ryh15vgsqqfhg6dm48p63r5fmqwsak721";
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
