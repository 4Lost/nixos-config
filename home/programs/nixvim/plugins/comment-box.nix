{...}:

{
  programs.nixvim = {
    plugins = {
      comment-box = {
        enable = true;
      };
      which-key.settings.spec = [
        {
          __unkeyed-1 = "<leader>c";
          group = "Boxes";
          icon = "□ ";
        }
      ];
    };
    keymaps = [
      {
        key = "<leader>cb";
        action = "<Cmd>CBccbox<CR>";
        options = {
          desc = "Box Title";
        };
      }
      {
        key = "<leader>ct";
        action = "<Cmd>CBllline<CR>";
        options = {
          desc = "Titled Line";
        };
      }
      {
        key = "<leader>cl";
        action = "<Cmd>CBline<CR>";
        options = {
          desc = "Simple Line";
        };
      }
      {
        key = "<leader>cm";
        action = "<Cmd>CBllbox14<CR>";
        options = {
          desc = "Marked";
        };
      }
      {
        key = "<leader>cd";
        action = "<Cmd>CBd<CR>";
        options = {
          desc = "Remove a Box";
        };
      }
    ];
  };
}

