-- Variables.
vim.g.loaded_node_provider = 0 -- Disable the Node.js provider.
vim.g.loaded_perl_provider = 0 -- Disable the Perl provider.
vim.g.loaded_python3_provider = 0 -- Disable the Python 3 provider.
vim.g.loaded_ruby_provider = 0 -- Disable the Ruby provider.
vim.g.mapleader = " " -- This is used as the value of the special string `<Leader>`.
vim.g.maplocalleader = "\\" -- Like `<Leader>` but for mappings which are local to a buffer.

-- Options.
vim.o.clipboard = "unnamedplus" -- Sync the Neovim clipboard to the system clipboard.
vim.o.colorcolumn = "80,+0" -- Create wrap guides at 80 columns and `textwidth`.
vim.o.confirm = true -- Ask for confirmation instead of failing on unsaved changes.
vim.o.expandtab = true -- Use the appropriate number of spaces to insert a `<Tab>`.
vim.o.foldlevelstart = 99 -- Open all folds by default.
vim.o.ignorecase = true -- Ignore case in search patterns.
vim.o.mouse = "a" -- Enable the mouse for all modes.
vim.o.mousemoveevent = true -- Enable mouse move events and the `<MouseMove>` key.
vim.o.number = true -- Print the line number in front of each line.
vim.o.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent.
vim.o.showmode = false -- Mode is already shown on the `statusline`.
vim.o.smartcase = true -- Override `ignorecase` if the pattern contains upper case letters.
vim.o.tabstop = 4 -- Number of spaces that a `<Tab>` in the file counts for.
vim.o.undofile = true -- Persist undo history across sessions.
vim.o.wildmode = "longest:full,full" -- Completion mode used for the `wildchar`.

-- Hide "How-to disable mouse" from the right click menu.
-- `pcall` makes this not fail if `init.lua` is sourced repeatedly.
pcall(vim.cmd.aunmenu, vim.fn.escape("PopUp.How-to disable mouse", " "))
pcall(vim.cmd.aunmenu, "PopUp.-2-")

-- Detect light background using the $COLORFGBG variable.
if string.match(vim.env.COLORFGBG or "", ";(%d+)$") == "15" then
   vim.opt.background = "light"
end

require("config.lazy")
