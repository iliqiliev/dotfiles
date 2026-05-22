-- Variables.
local globals = vim.g
globals.mapleader = " " -- This is used as the value of the special string <Leader>.
globals.maplocalleader = "\\" -- Like <Leader> but for mappings which are local to a buffer.

-- Options.
local options = vim.opt
options.expandtab = true -- Use the appropriate number of spaces to insert a <Tab>.
options.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent.
options.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for.
options.wildmode = "longest:full,full" -- Completion mode used for the 'wildchar'.
