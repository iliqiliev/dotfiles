vim.pack.add({
   {
      src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
      version = vim.version.range("3"),
   },
   -- Dependencies.
   { src = "https://github.com/nvim-lua/plenary.nvim" },
   { src = "https://github.com/MunifTanjim/nui.nvim" },
})
