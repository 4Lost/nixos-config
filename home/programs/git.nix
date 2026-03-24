{
  config,
  lib,
  pkgs,
  ...
}:

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
          email = config.sops.secrets.git.email.path;
          name = config.sops.secrets.git.name.path;
        };
      };
      signing = {
        key = config.sops.secrets.git.signingkey.path;
        format = lib.mkForce "openpgp";
        signByDefault = true;
      };
    };

    lazygit.enable = true;
  };
}
