{ ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      synctex-editor-command = ''
        nvim --headless -c "VimtexInverseSearch %l '%f'"
      '';
      synctex = true;
    };
  };
}
