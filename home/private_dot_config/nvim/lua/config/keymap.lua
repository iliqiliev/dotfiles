vim.keymap.set(
   { "n", "v" },
   "<Leader>cf", -- [c]ode [f]ormat.
   function()
      require("conform").format()
   end,
   { desc = "Format buffer" }
)

vim.keymap.set(
   { "n", "i" },
   "<F1>", -- Make F1 help more helpful.
   "<cmd>Pick help<cr>",
   { desc = "Find help tags" }
)

vim.keymap.set(
   "n",
   "<leader>ff", -- [f]ind [f]iles.
   "<cmd>Pick files<cr>",
   { desc = "Find files by name" }
)

vim.keymap.set(
   "n",
   "<leader>fg", -- [f]ind with [g]rep
   "<cmd>Pick grep_live<cr>",
   { desc = "Grep files" }
)

vim.keymap.set(
   "n",
   "<leader>fw", -- [f]ind [w]ord.
   "<cmd>Pick grep pattern='<cword>'<cr>",
   { desc = "Grep files for the word under the cursor" }
)
