{ ... }:

{
  programs.nixvim.plugins.nvim-autopairs = {
    enable = true;
    autoLoad = true;

    settings.check_ts = true;
  };
}
