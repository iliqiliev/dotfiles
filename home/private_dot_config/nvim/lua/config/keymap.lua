vim.keymap.set(
   { "n", "v" },
   "<leader>cr", -- [c]ode [r]ename.
   vim.lsp.buf.rename,
   { desc = "Rename symbol" }
)
