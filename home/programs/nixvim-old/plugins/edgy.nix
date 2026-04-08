{ ... }:

{
  programs.nixvim = {
    localOpts = {
      # views can only be fully collapsed with the global statusline
      laststatus = 3;
      # Default splitting will cause your main splits to jump when opening an edgebar.
      # To prevent this, set `splitkeep` to either `screen` or `topline`.
      splitkeep = "screen";
    };
    plugins = {
      edgy = {
        enable = true;
        autoLoad = true;
        settings = {
          bottom.__raw = ''
            {
              -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
              {
                ft = "toggleterm",
                size = { height = 0.2 },
                -- exclude floating windows
                filter = function(buf, win)
                  return vim.api.nvim_win_get_config(win).relative == ""
                end
              },
              "Trouble",
              { ft = "qf", title = "QuickFix" },
              {
                ft = "help",
                size = { height = 20 },
                -- only show help buffers
                filter = function(buf)
                  return vim.bo[buf].buftype == "help"
                end
              }
            }
          '';
          left.__raw = ''
            {
              -- Neo-tree filesystem always takes half the screen height
              {
                title = "Neo-Tree",
                ft = "neo-tree",
                filter = function(buf)
                  return vim.b[buf].neo_tree_source == "filesystem"
                end,
                size = { height = 0.2 }
              },
              {
                title = "Neo-Tree Git",
                ft = "neo-tree",
                filter = function(buf)
                  return vim.b[buf].neo_tree_source == "git_status"
                end,
                pinned = true,
                collapsed = true, -- show window as closed/collapsed on start
                open = "Neotree position=right git_status"
              },
              {
                title = "Neo-Tree Buffers",
                ft = "neo-tree",
                filter = function(buf)
                  return vim.b[buf].neo_tree_source == "buffers"
                end,
                pinned = true,
                collapsed = true, -- show window as closed/collapsed on start
                open = "Neotree position=top buffers"
              },
              -- any other neo-tree windows
              "neo-tree"
            }
          '';
        };
      };
    };
  };
}

