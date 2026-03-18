{ ... }:

{
  programs.nixvim = {
    extraConfigLua = ''
      vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", command = "set awa"})
    '';

    plugins = {
      mkdnflow = {
        enable = true;
        settings = {
          links = {
            style = "wiki";
            create_on_follow_failure = true;
            conceal = true;
            name_is_source = false;
            implicit_extension = "md";
            context = 0;
            transform_explicit.__raw = # Lua
              ''
                function(input)
                  if input:match('%d%d%d%d%-%d%d%-%d%d') then
                    return('journals/'..input)
                  else
                    require("zk.api").new(vim.fn.expand('%:p:h'), { dryRun = true }, function(err, res)
                        file_name = res.path:match("[^/]*.md$"):match("(.+)%..+$")
                      end)
                    return(file_name)
                  end
                end
              '';
          };
          modules = {
            conceal = true;
            cursor = true;
            folds = true;
            links = true;
            lists = true;
            maps = true;
            paths = true;
            tables = true;
            yaml = true;
          };
          filetypes = {
            markdown = true;
            qmd = true;
          };
          to_do = {
            symbols = [
              " "
              "-"
              "X"
            ];
            update_parents = true;
          };
          foldtext = {
            title_transformer.__raw = ''
              function()
                local function my_title_transformer(text)
                  local updated_title = text:gsub("%b{}", "")
                  updated_title = updated_title:gsub("^%s*", "")
                  updated_title = updated_title:gsub("%s*$", "")
                  updated_title = updated_title:gsub("^######", "░░░░░▓")
                  updated_title = updated_title:gsub("^#####", "░░░░▓▓")
                  updated_title = updated_title:gsub("^####", "░░░▓▓▓")
                  updated_title = updated_title:gsub("^###", "░░▓▓▓▓")
                  updated_title = updated_title:gsub("^##", "░▓▓▓▓▓")
                  updated_title = updated_title:gsub("^#", "▓▓▓▓▓▓")
                  return updated_title
                end
                return my_title_transformer
              end
            '';
            object_count_icon_set = "nerdfont";
            object_count_opts.__raw = ''
              function()
                local opts = {
                  link = false, -- Prevent links from being counted
                  blockquote = { -- Count block quotes (these aren't counted by default)
                    icon = ' ',
                    count_method = {
                      pattern = { "^>.+$" },
                      tally = "blocks",
                    }
                  },
                  fncblk = {
                    -- Override the icon for fenced code blocks with 
                    icon = " "
                  }
                }
                return opts
              end
            '';
            line_count = false;
            word_count = true;
            fill_chars = {
              left_edge = "╾─🖿 ─";
              right_edge = "──╼";
              item_separator = " · ";
              section_separator = " // ";
              left_inside = " ┝";
              right_inside = "┥ ";
              middle = "─";
            };
          };
          mappings = {
            MkdnEnter = [
              [
                "n"
                "v"
                "i"
              ]
              "<CR>"
            ];
            MkdnGoBack = [
              "n"
              "<BS>"
            ];
            MkdnDecreaseHeading = [
              "n"
              "-"
            ];
            MkdnIncreaseHeading = [
              "n"
              "+"
            ];
            MkdnNewListItemAboveInsert = [
              "n"
              "O"
            ];
            MkdnNewListItemBelowInsert = [
              "n"
              "o"
            ];
            MkdnTableNewColAfter = [
              "n"
              "<leader>ic"
            ];
            MkdnTableNewColBefore = [
              "n"
              "<leader>iC"
            ];
            MkdnTableNewRowAbove = [
              "n"
              "<leader>iR"
            ];
            MkdnTableNewRowBelow = [
              "n"
              "<leader>ir"
            ];
            MkdnTableNextCell = [
              "i"
              "<Tab>"
            ];
            MkdnTablePrevCell = [
              "i"
              "<S-Tab>"
            ];
            MkdnToggleToDo = [
              [
                "n"
                "v"
              ]
              "<C-Space>"
            ];
          };
          create_dirs = true;
          new_file_template = {
            use_template = true;
            placeholders = {
              before = {
                title = "link_title";
                date = "os_date";
              };
              after = { };
            };
            template = ''
              ---
              title: {{ title }}
              date: {{ date }}
              tags: []
              ---
              # {{ title }}
            '';
          };
        };
      };
    };
  };
}
