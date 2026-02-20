{ pkgs, ... }:

let
  dynomark-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "dynomark.nvim";
    doCheck = false;
    src = pkgs.pkgs.fetchFromGitHub {
      owner = "k-lar";
      repo = "dynomark.nvim";
      rev = "a59f4e44a7619747552d869747d0f3fbb7be32b3";
      hash = "sha256-zrPpFMLI2lbqm0W/I530519d7RQKDK9HRouMNAsXv+U=";
    };
  };
in
{
  programs.nixvim = {

    extraPlugins = [
      dynomark-nvim
    ];

    extraConfigLua = ''require('dynomark').setup({})'';

    keymaps = [
      {
        key = "<leader>v";
        action = "<Plug>(DynomarkToggle)";
        mode = [ "n" ];
        options = {
          desc = "Toggle Dynomark";
        };
      }
      {
        key = "<leader>V";
        action = "<Plug>(DynomarkRun)";
        mode = [ "n" ];
        options = {
          desc = "Run dynomark query under cursor";
        };
      }
    ];
  };
}
