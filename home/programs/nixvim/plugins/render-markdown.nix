{ pkgs, ... }:

{
  home.packages = with pkgs; [ python312Packages.pylatexenc ];

  programs.nixvim = {
    plugins = {
      render-markdown = {
        enable = true;
        lazyLoad.settings.filetypes = [ "md" ];

        settings = {
          ft = [ "markdown" ];
          latex.enabled = false;
          completions.lsp.enabled = true;
        };
      };

      which-key.settings.spec = [
        {
          __unkeyed-1 = "<leader>m";
          group = "Markdown";
          icon = " ";
        }
      ];
    };

    keymaps = [
      {
        action = "<CMD>RenderMarkdown toggle<CR>";
        key = "<leader>mp";
        mode = "n";
        options = {
          desc = "Toggle markdown preview";
        };
      }
    ];
  };
}
