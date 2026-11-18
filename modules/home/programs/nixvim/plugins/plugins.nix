{ self, ... }:

{
  flake.modules.homeManager.nixvim-plugins =
    { ... }:

    {
      imports = with self.modules.homeManager; [
        aerial
        autopairs
        barbar
        bullets
        cmp
        colorizor
        comment-box
        comment
        conform
        csvview
        dap
        dynomark
        edgy
        gitsigns
        img-clip
        knap
        lualine
        lsp
        lz-n
        markdown-preview
        mkdnflow
        neoscroll
        neotree
        noice
        notify
        oil
        otter
        papis
        rainbow
        render-markdown
        rustaceanvim
        smart-splits
        snippets
        sniprun
        startup
        surround
        todo-comments
        toggleterm
        treesitter
        trouble
        typst-preview
        typst-vim
        undotree
        unified
        vimtex
        web-devicons
        which-key
        wilder
        yazi
        yuck
      ];
    };
}
