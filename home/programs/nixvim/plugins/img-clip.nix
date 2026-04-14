{ ... }:

{
  programs.nixvim = {
    plugins.img-clip = {
      enable = true;
      lazyLoad.settings.filetypes = [
        "md"
        "tex"
        "typ"
      ];
    };

    keymaps = [
      {
        key = "<leader>p";
        action = "<cmd>PasteImage<cr>";
        options.desc = "Paste image";
      }
    ];
  };
}
