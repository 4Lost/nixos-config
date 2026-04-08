{ ... }:

{
  programs.nixvim = {
    plugins = {
      bullets = {
        enable = true;
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
              "o"
              "<Plug>(bullets-newline)"
            ]
            [
              "vmap"
              "gN"
              "<Plug>(bullets-renumber)"
            ]
            [
              "nmap"
              "gN"
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
    };
  };
}

