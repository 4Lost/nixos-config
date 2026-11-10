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

          code = {
            width = "block";
            min_width = 45;
            left_pad = 2;
            language_pad = 2;
          };

          heading.icons = [ "󰎤 " "󰎧 " "󰎪 " "󰎭 " "󰎱 " "󰎳 " ];
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
        key = "<leader>ms";
        mode = "n";
        options.desc = "Toggle markdown preview";
      }
    ];
  };
}
