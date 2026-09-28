vim.pack.add({
   {
      src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
      version = vim.version.range("3"),
   },
   -- Dependencies.
   { src = "https://github.com/nvim-lua/plenary.nvim" },
   { src = "https://github.com/MunifTanjim/nui.nvim" },
})

require("neo-tree").setup({
   source_selector = {
      winbar = true, -- Show tabs above the filetree.
      truncation_character = "…", -- Used when truncating the tab label.
   },
   sources = { -- Select which tabs will be shown.
      "filesystem",
      "git_status",
      "document_symbols",
      "buffers",
   },
})
