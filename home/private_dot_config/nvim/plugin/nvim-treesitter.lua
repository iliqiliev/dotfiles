vim.pack.add({
   { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter").install(require("config.languages").parsers)

-- Enable TreeSitter for all languages.
vim.api.nvim_create_autocmd("FileType", {
   callback = function()
      pcall(vim.treesitter.start)
   end,
})
