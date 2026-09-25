vim.pack.add({
   { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.lsp.enable(require("config.languages").servers)
