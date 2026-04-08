{ ... }:

{
  programs.nixvim.plugins.which-key = {
    enable = true;
    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
    ];
  };
}
