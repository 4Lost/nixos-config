{ ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      synctex-editor-command = ''
        nvim --headless -c "VimtexInverseSearch %l '%f'"
      ''; # include ${theme}
      synctex = true;
      font = "Fira Code 16";
    };
  };
}
