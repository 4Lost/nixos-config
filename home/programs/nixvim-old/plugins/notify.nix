{ ... }:

{
  programs.nixvim = {
    plugins = {
      notify = {
        enable = true;
        settings = {
          render = "wrapped-compact";
        };
      };
    };
    opts = {
      termguicolors = true;
    };
  };
}
