-- Disable Python's built-in jumps (e.g. `]]`, `]m`),
-- `nvim-treesitter-textobjects` replaces them.
vim.g.no_python_maps = 1

-- Disable auto-wrapping of code.
vim.opt_local.formatoptions:remove("t")
