{ ... }:

{
  programs.nixvim = {
    plugins = {
      undotree = {
        enable = true;
        lazyLoad.settings.cmd = "UndotreeShow";
      };

      which-key.settings.spec = [
        {
          __unkeyed-1 = "<leader>t";
          group = "Undotree";
          icon = " ";
        }
      ];
    };
    keymaps = [
      {
        key = "<leader>th";
        action = "<cmd>UndotreeHide<cr>";
        options.desc = "Hide undotree";
      }
      {
        key = "<leader>tf";
        action = "<cmd>UndotreeFocus<cr>";
        options.desc = "Focus undotree";
      }
      {
        key = "<leader>tp";
        action = "<cmd>UndotreePersistUndo<cr>";
        options.desc = "Persist undo";
      }
      {
        key = "<leader>ts";
        action = "<cmd>UndotreeShow<cr>";
        options.desc = "Show undotree";
      }
    ];
  };
}
