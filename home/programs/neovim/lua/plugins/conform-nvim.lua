return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" } })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
    config = function()
      require("conform").setup({
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_fallback = true,
        },
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "autopep8" },
          haskell = { "fourmolu" },
          bash = { "shellcheck", "shellharden" },
          sh = { "shfmt" },
          markdown = { "prettierd" },
          json = { "prettierd" },
          yaml = { "prettierd" },
          nix = { "nixfmt-rfc-style" },
          tex = { "latexindent" },
          c = { "clang_format" },
          cpp = { "clang_format" },
          ["*"] = { "codespell" },
          ["_"] = { "trim_whitespace" },
        },
        formatters = {
          stylua = {
            inherit = true,
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
          },
          codespell = {
            inherit = true,
            prepend_args = { "-L", "launch" },
          },
          latexindent = {
            inherit = true,
            prepend_args = { "-y=\"defaultIndent:'  '\"" },
          },
          clang_format = {
            prepend_args = {
              "--fallback-style=LLVM",
            },
          },
        },
      })
    end,
  },
}
