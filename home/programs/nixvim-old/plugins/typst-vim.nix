{ ... }:

# TODO: coneal does not work
{
  programs.nixvim = {
    plugins = {
      typst-vim = {
        enable = true;
        settings = {
          conceal = 1;
          conceal_math = 1;
          conceal_emoji = 1;
        };
      };
    };
  };
}
