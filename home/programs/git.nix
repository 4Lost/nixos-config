{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs_22
    cz-cli
    tig
  ];
  programs.git = {
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

  programs.lazygit = {
    enable = true;
    # https://github.com/catppuccin/lazygit
    settings = {
      gui = {
        theme = {
          activeBorderColor = [
            "#f4dbd6"
            "bold"
          ];
          inactiveBorderColor = [ "#a5adcb" ];
          optionsTextColor = [ "#8aadf4" ];
          selectedLineBgColor = [ "#363a4f" ];
          cherryPickedCommitBgColor = [ "#494d64" ];
          cherryPickedCommitFgColor = [ "#f4dbd6" ];
          unstagedChangesColor = [ "#ed8796" ];
          defaultFgColor = [ "#cad3f5" ];
          searchingActiveBorderColor = [ "#eed49f" ];
        };
        authorColors = {
          "*" = "#b7bdf8";
        };
      };
    };
  };
}
