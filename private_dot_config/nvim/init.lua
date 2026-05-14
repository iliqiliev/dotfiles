-- Setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Initialize lazy.nvim
require("config.lazy")

-- Formatting
vim.opt.expandtab = true -- Use the appropriate number of spaces to insert a <Tab>.
vim.opt.shiftwidth = 4   -- Number of spaces to use for each step of (auto)indent.
vim.opt.tabstop = 4      -- Number of spaces that a <Tab> in the file counts for.
