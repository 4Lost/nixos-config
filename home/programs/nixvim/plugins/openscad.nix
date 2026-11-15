{ ... }:

{
  programs.nixvim.plugins.openscad = {
    enable = true;
    lazyLoad.settings.filetype = [ "scad" ];

    luaConfig.post = ''
      vim.g.openscad_fuzzy_finder = 'skim'
      -- when the pdf_command is run, the last argument will be the pdf filename
      vim.g.openscad_pdf_command = 'zathura'
      vim.g.openscad_cheatsheet_window_blend = 15 --%
      vim.g.openscad_load_snippets = false
      -- should the openscad project automatically be opened on startup
      vim.g.openscad_auto_open = false
      vim.g.openscad_default_mappings = true
    '';
  };
}
