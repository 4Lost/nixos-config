{ ... }:

{
  programs.nixvim.plugins.comment = {
    enable = true;
    autoLoad = true;

    settings.mappings.basic = true;
  };
}
