{ pkgs,... }:

{
  programs.nixvim = {
    extraPackages = with pkgs; [
      texliveFull
      texlivePackages.standalone
      texlivePackages.relsize # needed for BA
      # papis-nvim
    ];

    plugins = {
      vimtex = {
        enable = true;
        lazyLoad.settings.filetype = [ "tex" ];

        settings = {
          view_automatic = false;
          mappings_disable = {
            "n" = [ "K" ];
          };
          view_method = "zathura";
        };
      };

      ltex-extra = {
        enable = true;
        lazyLoad.settings.filetype = [ "tex" ];
      };

      texpresso = {
        enable = true;
        lazyload.settings.filetype = [ "tex" ];
      };

      which-key.settings.spec = [
        {
          __unkeyed-1 = "<leader>v";
          group = "Vimtex";
          icon = " ";
        }
      ];
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

    keymaps = [
      {
        key = "<leader>vc";
        action = "<cmd>VimtexCompile<cr>";
        options.desc = "Start Vimtex";
      }
      {
        key = "<leader>vs";
        action = "<cmd>VimtexStop<cr>";
        options.desc = "Stop Vimtex";
      }
      {
        key = "<leader>vr";
        action = "<cmd>VimtexClean<cr>";
        options.desc = "Clean Vimtex";
      }
    ];

    files."ftplugin/latex.lua".keymaps = [
      {
        action = "<CMD>Texpresso %<CR>";
        key = "<C-k>t";
        mode = [
          "n"
          "v"
          "i"
        ];
        options.desc = "Start Texpresso";
      }
    ];
  };
}
