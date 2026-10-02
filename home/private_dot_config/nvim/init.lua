-- Variables.
vim.g.loaded_node_provider = 0 -- Disable the Node.js provider.
vim.g.loaded_perl_provider = 0 -- Disable the Perl provider.
vim.g.loaded_python3_provider = 0 -- Disable the Python 3 provider.
vim.g.loaded_ruby_provider = 0 -- Disable the Ruby provider.
vim.g.mapleader = " " -- This is used as the value of the special string `<Leader>`.
vim.g.maplocalleader = "\\" -- Like `<Leader>` but for mappings which are local to a buffer.

-- Options.
vim.opt.clipboard = "unnamedplus" -- Sync the Neovim clipboard to the system clipboard.
vim.opt.confirm = true -- Ask for confirmation instead of failing on unsaved changes.
vim.opt.expandtab = true -- Use the appropriate number of spaces to insert a `<Tab>`.
vim.opt.ignorecase = true -- Ignore case in search patterns.
vim.opt.mouse = "a" -- Enable the mouse for all modes.
vim.opt.number = true -- Print the line number in front of each line.
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent.
vim.opt.showmode = false -- Mode is already shown on the `statusline`.
vim.opt.smartcase = true -- Override `ignorecase` if the pattern contains upper case letters.
vim.opt.tabstop = 4 -- Number of spaces that a `<Tab>` in the file counts for.
vim.opt.undofile = true -- Persist undo history accross sessions.
vim.opt.wildmode = "longest:full,full" -- Completion mode used for the `wildchar`.

-- Hide "How-to disable mouse" from the right click menu.
-- `silent!` makes this not fail if `init.lua` is sourced repeatedly.
vim.cmd([[
   silent! aunmenu PopUp.How-to\ disable\ mouse
   silent! aunmenu PopUp.-2-
]])

-- Detect light background using the $COLORFGBG variable.
if string.match(vim.env.COLORFGBG or "", ";(%d+)$") == "15" then
   vim.opt.background = "light"
end

require("config.keymap") -- Load keymap configuration from a central location.

vim.pack.add({
   { src = "https://github.com/folke/lazy.nvim" },
})

require("lazy").setup("plugins", {
   rocks = {
      enabled = false,
   },
})
