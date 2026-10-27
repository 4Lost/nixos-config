{ ... }:

{
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    autoLoad = true;

    settings.enable_git_status = true;
  };
}
