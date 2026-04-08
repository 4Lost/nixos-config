{ ... }:

# TODO: Make filetype keybindings work
{
  programs.nixvim = {
    plugins = {
      texpresso = {
        enable = false;
      };
    };
    files = {
      "ftplugin/latex.lua" = {
        keymaps = [
          {
            action = "<CMD>Texpresso %<CR>";
            key = "<C-k>t";
            mode = [
              "n"
              "v"
              "i"
            ];
            options = {
              desc = "Start Texpresso";
            };
          }
        ];
      };
    };
  };
}
