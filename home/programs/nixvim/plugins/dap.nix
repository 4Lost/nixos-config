{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    lldb_19
    gdb
    rustc
    # python3.withPackages
    # (ps: with ps; [ debugpy ])
  ];

  programs.nixvim = {
    plugins = {
      dap-python = {
        enable = true;
      };

      dap = {
        enable = true;
        luaConfig.post = ''
          local dap, dapui = require("dap"), require("dapui")
          dap.listeners.before.attach.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.launch.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
          end
          dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
          end
        '';
        adapters = {
          executables = {
            lldb = {
              command = "${pkgs.lldb_19}/bin/lldb-dap";
            };
            gdb = {
              command = "${pkgs.gdb}/bin/gdb";
              args = [
                "--interpreter=dap"
                "--eval-command"
                "set print pretty on"
              ];
            };
            rust-gdb = {
              command = "${pkgs.rustc}/bin/rust-gdb";
              args = [
                "--interpreter=dap"
                "--eval-command"
                "set print pretty on"
              ];
            };
          };
        };
        signs = {
          dapBreakpoint.text = "";
        };
        configurations = {
          cpp = [
            {
              name = "Launch";
              type = "gdb";
              request = "launch";
              program.__raw = # lua
                ''
                  function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                  end
                '';
              cwd = "\${workspaceFolder}";
              stopAtBeginningOfMainSubprogram = false;
            }
            {
              name = "Select and attach to process";
              type = "gdb";
              request = "attach";
              program._raw = # lua
                ''
                  function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                  end
                '';
              pid.__raw = ''
                function()
                  local name = vim.fn.input('Executable name (filter): ')
                  return require("dap.utils").pick_process({ filter = name })
                end
              '';
              cwd = "\${workspaceFolder}";
            }
            {
              name = "Attach to gdbserver :1234";
              type = "gdb";
              request = "attach";
              target = "localhost:1234";
              program.__raw = ''
                function()
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end
              '';
              cwd = "\${workspaceFolder}";
            }
          ];
          c = [
            {
              name = "Launch file";
              type = "lldb";
              request = "launch";
              cwd = "\${workspaceFolder}";
              stopOnEntry = false;
              program.__raw = # lua
                ''
                  function()
                    return coroutine.create(function(coro)
                      local opts = {}
                      require("telescope.pickers")
                        .new(opts, {
                          prompt_title = "Path to executable",
                          finder = require("telescope.finders").new_oneshot_job({ "fd", "--hidden", "--no-ignore", "--type", "x" }, {}),
                          sorter = require("telescope.config").values.generic_sorter(opts),
                          attach_mappings = function(buffer_number)
                            require("telescope.actions").select_default:replace(function()
                              require("telescope.actions").close(buffer_number)
                              coroutine.resume(coro, require("telescope.actions.state").get_selected_entry()[1])
                            end)
                            return true
                          end,
                        })
                        :find()
                    end)
                  end
                '';
              args = { };
            }
          ];
          rust = [
            {
              name = "Launch";
              type = "rust-gdb";
              request = "launch";
              program.__raw = ''
                function()
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end
              '';
              args = { };
              cwd = "\${workspaceFolder}";
              stopAtBeginningOfMainSubprogram = false;
            }
            {
              name = "Select and attach to process";
              type = "rust-gdb";
              request = "attach";
              program.__raw = ''
                function()
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end
              '';
              pid.__raw = ''
                function()
                  local name = vim.fn.input('Executable name (filter): ')
                  return require("dap.utils").pick_process({ filter = name })
                end
              '';
              cwd = "\${workspaceFolder}";
            }
            {
              name = "Attach to gdbserver :1234";
              type = "rust-gdb";
              request = "attach";
              target = "localhost:1234";
              program.__raw = ''
                function()
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end
              '';
              cwd = "\${workspaceFolder}";
            }
          ];
        };
      };
      dap-ui = {
        enable = true;
      };
      dap-virtual-text = {
        enable = true;
      };
      which-key.settings.spec = [
        {
          __unkeyed-1 = "<leader>d";
          group = "Debugger";
          icon = " ";
        }
      ];
    };
    keymaps = [
      {
        key = "<leader>dt";
        action.__raw = "function() require('dap').toggle_breakpoint() end";
        mode = [ "n" ];
        options = {
          desc = "Toggle Breakpoint";
        };
      }
      {
        key = "<leader>dc";
        action.__raw = "function() require('dap').continue() end";
        mode = [ "n" ];
        options = {
          desc = "Continue";
        };
      }
      {
        key = "<leader>dc";
        action.__raw = "function() require('dap').continue() end";
        mode = [ "n" ];
        options = {
          desc = "Continue";
        };
      }
      {
        key = "<leader>di";
        action.__raw = "function() require('dap').step_into() end";
        mode = [ "n" ];
        options = {
          desc = "Step Into";
        };
      }
      {
        key = "<leader>do";
        action.__raw = "function() require('dap').step_over() end";
        mode = [ "n" ];
        options = {
          desc = "Step Over";
        };
      }
      {
        key = "<leader>du";
        action.__raw = "function() require('dap').step_out() end";
        mode = [ "n" ];
        options = {
          desc = "Step Out";
        };
      }
      {
        key = "<leader>dr";
        action.__raw = "function() require('dap').repl.open() end";
        mode = [ "n" ];
        options = {
          desc = "Open REPL";
        };
      }
      {
        key = "<leader>dl";
        action.__raw = "function() require('dap').run_last() end";
        mode = [ "n" ];
        options = {
          desc = "Run Last";
        };
      }
      {
        key = "<leader>dq";
        action.__raw = # lua
          ''
            function()
                require("dap").terminate()
                require("dapui").close()
                require("nvim-dap-virtual-text").toggle()
            end
          '';
        mode = [ "n" ];
        options = {
          desc = "Terminate";
        };
      }
      {
        key = "<leader>db";
        action.__raw = "function() require('dap').list_breakpoints() end";
        mode = [ "n" ];
        options = {
          desc = "List Breakpoints";
        };
      }
      {
        key = "<leader>de";
        action.__raw = "function() require('dap').set_exception_breakpoints({ ' all ' }) end";
        mode = [ "n" ];
        options = {
          desc = "Set Exception Breakpoints";
        };
      }
    ];
  };
}

