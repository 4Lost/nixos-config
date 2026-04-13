{ pkgs, ... }:

{
  programs.nixvim = {
    extraPackages = with pkgs; [ rust-analyzer ];

    plugins.rustaceanvim = {
      enable = true;
      lazyload.settings.filetype = [ "rs" ];
    };

    files."ftplugin/rust.lua" = {
      keymaps = [
        {
          action.__raw = ''
            function()
              vim.cmd.RustAnalyzer('codeAction')
            end
          '';
          key = "<leader>a";
          mode = [ "n" ];
          options = {
            desc = "Code action";
            silent = true;
            buffer.__raw = "vim.api.nvim_get_current_buf()";
          };
        }
        {
          action.__raw = ''
            function()
              vim.cmd.RustAnalyzer({'hover', 'actions'})
            end
          '';
          key = "K";
          mode = [ "n" ];
          options = {
            silent = true;
            buffer.__raw = "vim.api.nvim_get_current_buf()";
          };
        }
      ];
    };
  };
}
