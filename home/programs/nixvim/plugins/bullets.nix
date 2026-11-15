{ ... }:

{
  programs.nixvim.plugins.bullets = {
    enable = true;
    lazyLoad.settings.filetypes = [ "md" "txt" "gitcommit" ];

    settings = {
      enabled_file_types = [
        "markdown"
        "text"
        "gitcommit"
      ];
      set_mappings = 0;
      checkbox_markers = " -X";
      custom_mappings = [
        [
          "nmap"
          "<leader>mn"
          "<Plug>(bullets-newline)"
        ]
        [
          "vmap"
          "<leader>mr"
          "<Plug>(bullets-renumber)"
        ]
        [
          "nmap"
          "<leader>mr"
          "<Plug>(bullets-renumber)"
        ]
        [
          "imap"
          "<C-t>"
          "<Plug>(bullets-demote)"
        ]
        [
          "nmap"
          ">>"
          "<Plug>(bullets-demote)"
        ]
        [
          "vmap"
          ">"
          "<Plug>(bullets-demote)"
        ]
        [
          "imap"
          "<C-d>"
          "<Plug>(bullets-promote)"
        ]
        [
          "nmap"
          "<<"
          "<Plug>(bullets-promote)"
        ]
        [
          "vmap"
          "<"
          "<Plug>(bullets-promote)"
        ]
      ];
    };
  };
}
