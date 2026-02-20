{ ... }:

{
  programs.nixvim.plugins = {
    peek = {
      enable = true;
      settings = {
        app = "firefox";
      };
    };
  };
}
