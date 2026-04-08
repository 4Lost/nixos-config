{ pkgs, ... }:

{
  home.packages = with pkgs; [ python312Packages.pylatexenc ];

  programs.nixvim.plugins = {
    render-markdown = {
      enable = true;
      settings = {
        ft = [
          "markdown"
          "quarto"
        ];
        latex = {
          enabled = false;
        };
        completions = {
          lsp = {
            enabled = true;
          };
        };
      };
    };

    web-devicons = {
      enable = true;
    };
  };
}
