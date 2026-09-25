vim.pack.add({
   { src = "https://github.com/stevearc/conform.nvim" },
})

local shfmt_args = { "--indent", "4" } -- 0 for tabs (default), >0 for number of spaces.

require("conform").setup({
   default_format_opts = {
      async = true,
      lsp_format = "fallback",
   },

   formatters = {
      shfmt = { append_args = shfmt_args },
   },

   formatters_by_ft = vim.tbl_extend("error", require("config.languages").formatters, {
      -- https://github.com/stevearc/conform.nvim/blob/master/doc/advanced_topics.md#injected-language-formatting-code-blocks
      ["*"] = { "injected" },
      -- For filetypes without a defined formatter.
      ["_"] = { "trim_whitespace" },
   }),
} --[[@as conform.setupOpts]])

vim.keymap.set(
   { "n", "v" },
   "<Leader>f",
   require("conform").format,
   { desc = "Format Buffer" }
)
