{ ... }:

{
  programs.nixvim = {
    plugins = {
      neo-tree = {
        enable = true;
        settings = {
          enable_git_status = true;
        };
      };
    };
  };
}
