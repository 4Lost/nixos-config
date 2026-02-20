{ ... }:

{
  programs.nixvim = {
    plugins = {
      vimtex = {
        enable = true;
        settings = {
          view_automatic = false;
          mappings_disable = {
            "n" = [ "K" ];
          };
        };
      };
    };

    autoGroups = {
      "lazyvim_vimtex_conceal" = {
        clear = true;
      };
    };

    autoCmd = [
      {
        event = [ "FileType" ];
        group = "lazyvim_vimtex_conceal";
        pattern = [
          "bib"
          "tex"
        ];
        callback.__raw = # lua
          ''
            function ()
              vim.wo.conceallevel = 2
            end
          '';
      }
    ];
  };
}
