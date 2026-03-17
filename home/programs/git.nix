{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs_22
    cz-cli
    tig
  ];

  programs = {
    git = {
      enable = true;
      settings = {
        init = {
          defaultBranch = "main";
        };
        user = {
          email = "elias.schroeter@e.email";
          name = "Elias Schröter";
        };
      };
      signing = {
        key = "04F3A2ED4B33F254";
        format = lib.mkForce "openpgp";
        signByDefault = true;
      };
    };

    lazygit.enable = true;
  };
}
