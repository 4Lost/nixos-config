{ ... }: # scaleFactor,

{
  programs.zathura = {
    enable = true;
    options = {
      synctex-editor-command = ''
        nvim --headless -c "VimtexInverseSearch %l '%f'"
      ''; # include ${theme}
      synctex = true;
      font = "Fire Code 16"; # "Fira Code ${toString (scaleFactor * 16)}";
    };
  };
}
