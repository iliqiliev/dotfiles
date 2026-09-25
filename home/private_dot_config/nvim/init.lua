-- Variables.
vim.g.loaded_node_provider = 0 -- Disable the Node.js provider.
vim.g.loaded_perl_provider = 0 -- Disable the Perl provider.
vim.g.loaded_python3_provider = 0 -- Disable the Python 3 provider.
vim.g.loaded_ruby_provider = 0 -- Disable the Ruby provider.
vim.g.mapleader = " " -- This is used as the value of the special string `<Leader>`.
vim.g.maplocalleader = "\\" -- Like `<Leader>` but for mappings which are local to a buffer.

-- Options.
vim.opt.confirm = true -- Ask for confirmation instead of failing on unsaved changes.
vim.opt.expandtab = true -- Use the appropriate number of spaces to insert a `<Tab>`.
vim.opt.ignorecase = true -- Ignore case in search patterns.
vim.opt.mouse = "a" -- Enable the mouse for all modes.
vim.opt.number = true -- Print the line number in front of each line.
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent.
vim.opt.smartcase = true -- Override `ignorecase` if the pattern contains upper case letters.
vim.opt.tabstop = 4 -- Number of spaces that a `<Tab>` in the file counts for.
vim.opt.undofile = true -- Persist undo history accross sessions.
vim.opt.wildmode = "longest:full,full" -- Completion mode used for the `wildchar`.

-- Hide "How-to disable mouse" from the right click menu.
vim.cmd([[
   aunmenu PopUp.How-to\ disable\ mouse
   aunmenu PopUp.-2-
]])
