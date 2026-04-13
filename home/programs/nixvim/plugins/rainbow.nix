{ ... }:

{
  programs.nixvim.plugins.rainbow = {
    enable = true;
    autoLoad = true;

    settings = {
      active = 1;
      conf = {
        guifgs = [
          "#f5c2e7"
          "#eba0ac"
          "#a6e3a1"
          "#74c7ec"
          "#f5e0dc"
          "#cba6f7"
          "#fab387"
          "#94e2d5"
          "#89b4fa"
          "#f2cdcd"
          "#f38ba8"
          "#f9e2af"
          "#89dceb"
          "#b4befe"
        ];
        operators = "_,_";
        parentheses = [
          "start=/(/ end=/)/ fold"
          "start=/{/ end=/}/ fold"
          "start=/\\[/ end=/\\]/ fold"
          "start=/\\begin/ end=/\\end/ fold"
        ];
        separately = {
          "*".parentheses = [
            "start=/(/ end=/)/ fold"
            "start=/{/ end=/}/ fold"
            "start=/\\[/ end=/\\]/ fold"
          ];
          css = 0;
          haskell.parentheses = [
            "start=/(/ end=/)/ fold"
            "start=/\[/ end=/\]/ fold"
            "start=/\v\{\ze[^-]/ end=/}/ fold"
          ];
          lisp.guifgs = [
            "#f5c2e7"
            "#eba0ac"
            "#a6e3a1"
            "#74c7ec"
            "#f5e0dc"
            "#cba6f7"
            "#fab387"
            "#94e2d5"
            "#89b4fa"
            "#f2cdcd"
            "#f38ba8"
            "#f9e2af"
            "#89dceb"
            "#b4befe"
          ];
          markdown.parentheses_options = "containedin=markdownCode contained";
          nerdtree = 0;
          perl.syn_name_prefix = "perlBlockFoldRainbow";
          stylus.parentheses = [ "start=/{/ end=/}/ fold contains=@colorableGroup" ];
          tex.parentheses = [
            "start=/(/ end=/)/ fold"
            "start=/{/ end=/}/ fold"
            "start=/\\[/ end=/\\]/ fold"
            "start=/\\begin/ end=/\\end/ fold"
          ];
          vim.parentheses_options = "containedin=vimFuncBody";
        };
      };
    };
  };
}
