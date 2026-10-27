{ ... }:

{
  programs.nixvim.plugins.wilder = {
    enable = true;
    autoLoad = true;

    settings.modes = [
      ":"
      "/"
      "?"
    ];

    # Configure the wilder engine
    options = {
      pipeline.__raw = ''
        wilder.branch(
          wilder.cmdline_pipeline({
            fuzzy = 1,
            set_device = 1,
          }),
          wilder.vim_search_pipeline()
        )
      '';
      renderer.__raw = ''
        wilder.popupmenu_renderer(
            wilder.popupmenu_border_theme({
              highlighter = wilder.basic_highlighter(),
              highlights = {
                accent = "WilderAccent",
              },
              border = "rounded",
              left = { " ", wilder.popupmenu_devicons() },
              right = { " ", wilder.popupmenu_scrollbar() },
            })
          )
      '';
    };
  };

  # Define the custom highlight group for the accent color
  programs.nixvim.highlight = {
    WilderAccent = {
      fg = "#f5c2e7";
      bold = true;
    };
  };
}
