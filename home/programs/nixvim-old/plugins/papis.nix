{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      papis = {
        enable = true;
        settings = {
          yq_bin = "${pkgs.yq-go}/bin/yq";
          search = {
            provider = "telescope";
          };
        };
      };
    };

    keymaps = [
      {
        key = "<leader>pp";
        action = "<CMD>Papis search<CR>";
        mode = [ "n" ];
        options = {
          desc = "Papis";
        };
      }
    ];
  };
}
