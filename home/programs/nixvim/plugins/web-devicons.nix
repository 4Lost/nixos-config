{ ... }:

{
  programs.nixvim.plugins.web-devicons = {
    enable = true;
    lazyLoad.settings.event = [
      "BufReadPost"
      "BufNewFile"
    ];
  };
}
