{ ... }:

{
  programs.nixvim = {
    plugins = {
      zk = {
        enable = true;
        settings = {
          picker = "telescope";
        };
      };
      which-key.settings.spec = [
        {
          __unkeyed-1 = "<leader>z";
          group = "Zettelkasten";
          icon = "󰝰 ";
        }
      ];
    };
    keymaps = [
      {
        key = "<leader>zn";
        action = "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>";
        mode = [ "n" ];
        options = {
          desc = "Create";
        };
      }
      {
        key = "<leader>zo";
        action = "<Cmd>ZkNotes { sort = { 'modified' } }<CR>";
        mode = [ "n" ];
        options = {
          desc = "Open";
        };
      }
      {
        key = "<leader>zt";
        action = "<Cmd>ZkTags<CR>";
        mode = [ "n" ];
        options = {
          desc = "Open Tags";
        };
      }
      {
        key = "<leader>zf";
        action = "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>";
        mode = [ "n" ];
        options = {
          desc = "Search";
        };
      }
      {
        key = "<leader>zf";
        action = ":'<,'>ZkMatch<CR>";
        mode = [ "v" ];
        options = {
          desc = "Search (Matching the Selection)";
        };
      }
    ];
    files = {
      # TODO: Add descriptions
      # TODO: Did the sytnax change?
      "ftplugin/markdown.lua" = {
        extraConfigLua = # lua
          ''
            -- Add the key mappings only for Markdown files in a zk notebook.
            if require("zk.util").notebook_root(vim.fn.expand('%:p')) ~= nil then
              local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end
              local opts = { noremap=true, silent=false }

              -- Create a new note after asking for its title.
              -- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
              map("n", "<leader>zn", "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)
              -- Create a new note in the same directory as the current buffer, using the current selection for title.
              map("v", "<leader>znt", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)
              -- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
              map("v", "<leader>znc", ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)

              -- Open notes linking to the current buffer.
              map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
              -- Open notes linked by the current buffer.
              map("n", "<leader>zl", "<Cmd>ZkLinks<CR>", opts)

              -- Preview a linked note.
              map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
              -- Open the code actions for a visual selection.
              map("v", "<leader>za", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
            end
          '';
      };
    };
  };
}
