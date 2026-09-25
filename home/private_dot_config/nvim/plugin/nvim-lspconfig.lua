vim.pack.add({
   { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.lsp.enable({
   "bashls",
   "fish_lsp",
   "lua_ls",
   "ty",
   "sqruff",
   "tclsp",
   "tombi",
})
