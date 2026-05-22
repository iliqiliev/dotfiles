vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
   default_format_opts = {
      async = true,
      lsp_format = "fallback",
   },

   formatters = {
      shfmt = { append_args = { "--indent", "4" } },
   },

   formatters_by_ft = {
      fish = { "fish_indent" },
      lua = { "stylua" },
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
      sh = { "shfmt" },
      tcl = { "tclfmt" },
      toml = { "tombi" },
      ["_"] = { "trim_whitespace" },
   },
})

vim.keymap.set(
   { "n", "v" },
   "<Leader>f",
   require("conform").format,
   { desc = "Format Buffer" }
)
