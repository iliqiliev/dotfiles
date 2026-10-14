vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>quitall<cr>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Write" })

-- `d` discards, `x` cuts.
-- `_` is the blackhole register that swallows the contents.
vim.keymap.set("n", "d", [["_d]], { desc = "Discard" })
vim.keymap.set("n", "D", [["_D]], { desc = "Discard to end of line" })
vim.keymap.set("x", "d", [["_d]], { desc = "Discard selection" })
vim.keymap.set("x", "D", [["_D]], { desc = "Discard lines" })
