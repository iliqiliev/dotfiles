vim.pack.add({
   { src = "https://github.com/stevearc/conform.nvim" },
})

local shfmt_args = { "--indent", "4" } -- 0 for tabs (default), >0 for number of spaces.

require("conform").setup({
   default_format_opts = {
      async = true,
      lsp_format = "fallback",
   },

   formatters = { shfmt = { append_args = shfmt_args } },

   formatters_by_ft = {
      sh = { lsp_format = "prefer", "shfmt" },
      fish = { lsp_format = "prefer", "fish_indent" },
      lua = { "stylua" },
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
      sql = { lsp_format = "prefer", "sqruff" },
      tcl = { lsp_format = "prefer", "tclfmt" },
      toml = { lsp_format = "prefer", "tombi" },
      ["*"] = { "injected" }, -- https://github.com/stevearc/conform.nvim/blob/master/doc/advanced_topics.md#injected-language-formatting-code-blocks
      ["_"] = { "trim_whitespace" }, -- For filetypes without a defined formatter.
   },
} --[[@as conform.setupOpts]])

vim.keymap.set(
   { "n", "v" },
   "<Leader>f",
   require("conform").format,
   { desc = "Format Buffer" }
)
