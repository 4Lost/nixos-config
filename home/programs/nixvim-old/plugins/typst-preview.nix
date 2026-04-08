{ ... }:

{
  programs.nixvim = {
    plugins = {
      typst-preview = {
        enable = true;
        lazyLoad = {
          settings = {
            ft = "typst";
            cmd = "TypstPreview";
          };
        };
        settings = {
          open_command = "qutebrowser --target tab %s";
        };
      };
    };
    files = {
      "ftplugin/typst.lua" = {
        keymaps = [
          {
            action = "<CMD>TypstPreview<CR>";
            key = "<C-k>t";
            mode = [
              "n"
              "v"
              "i"
            ];
            options = {
              desc = "Typst Preview";
            };
          }
        ];
      };
    };
  };
}
