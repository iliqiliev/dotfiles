vim.keymap.set(
   { "n", "v" },
   "<leader>cr", -- [c]ode [r]ename.
   vim.lsp.buf.rename,
   { desc = "Rename symbol" }
)

vim.keymap.set(
   { "n", "v" },
   "<Leader>cf", -- [c]ode [f]ormat.
   function()
      require("conform").format() -- conform.nvim
   end,
   { desc = "Format buffer" }
)

vim.keymap.set(
   { "n", "i" },
   "<F1>", -- Make F1 help more helpful.
   "<cmd>Pick help<cr>", -- mini.pick
   { desc = "Find help tags" }
)

vim.keymap.set(
   "n",
   "<leader>ff", -- [f]ind [f]iles.
   "<cmd>Pick files<cr>", -- mini.pick
   { desc = "Find files by name" }
)

vim.keymap.set(
   "n",
   "<leader>fg", -- [f]ind with [g]rep
   "<cmd>Pick grep_live<cr>", -- mini.pick
   { desc = "Grep files" }
)

vim.keymap.set(
   "n",
   "<leader>fw", -- [f]ind [w]ord.
   "<cmd>Pick grep pattern='<cword>'<cr>", -- mini.pick
   { desc = "Grep files for the word under the cursor" }
)

vim.keymap.set(
   "n",
   "<leader>et", -- [e]xplorer [t]ree
   function()
      require("mini.files").open() -- mini.files
   end,
   { desc = "Open the file explorer" }
)

vim.keymap.set(
   "n",
   "<leader>ec", -- [e]xplorer at [c]urrent file
   function()
      require("mini.files").open(vim.api.nvim_buf_get_name(0)) -- mini.files
   end,
   { desc = "Open the file explorer at the current file" }
)
