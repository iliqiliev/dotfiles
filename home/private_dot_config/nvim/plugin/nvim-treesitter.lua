vim.pack.add({
   { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter").install({
   "bash",
   "fish",
   "lua",
   "python",
   "query",
   "sql",
   "tcl",
   "toml",
})
