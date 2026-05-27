-- Variables.
local globals = vim.g
globals.mapleader = " " -- This is used as the value of the special string <Leader>.
globals.maplocalleader = "\\" -- Like <Leader> but for mappings which are local to a buffer.
globals["chezmoi#use_tmp_buffer"] = true -- For better chezmoi filetype detection.

-- Options.
local options = vim.opt
options.expandtab = true -- Use the appropriate number of spaces to insert a <Tab>.
options.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent.
options.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for.
options.wildmode = "longest:full,full" -- Completion mode used for the 'wildchar'.

-- Plugins.
vim.pack.add({
   "https://github.com/Mofiqul/adwaita.nvim",
   "https://github.com/mason-org/mason.nvim",
   "https://github.com/stevearc/conform.nvim",
   "https://github.com/neovim/nvim-lspconfig",
   "https://github.com/nvim-treesitter/nvim-treesitter",
   "https://github.com/noirbizarre/ensure.nvim",
   "https://github.com/windwp/nvim-autopairs",
   "https://github.com/nvim-lualine/lualine.nvim",
   "https://github.com/alker0/chezmoi.vim",
})

-- adwaita.nvim:
vim.g.adwaita_transparent = true -- Makes the background transparent.
vim.cmd("colorscheme adwaita")

-- mason.nvim:
require("mason").setup()

-- conform.nvim:
require("conform").setup({
   default_format_opts = {
      async = true,
      lsp_format = "fallback",
   },

   formatters = {
      shfmt = { append_args = { "--indent", "4" } },
   },

   formatters_by_ft = {
      fish = { "fish_indent" },
      lua = { "stylua" },
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
      sh = { "shfmt" },
      tcl = { "tclfmt" },
      toml = { "tombi" },
      ["_"] = { "trim_whitespace" },
   },
})

vim.keymap.set(
   { "n", "v" },
   "<Leader>f",
   require("conform").format,
   { desc = "Format Buffer" }
)

-- nvim-lspconfig:
vim.lsp.enable({
   "basedpyright", -- Python.
   "bashls", -- Bash/sh.
   "fish_lsp", -- Fish.
   "lua_ls", -- Lua.
   "tclsp", -- TCL.
   "tombi", -- TOML.
})

-- nvim-treesitter:
-- TODO: setup

-- ensure.nvim:
require("ensure").setup({
   install = true, -- Install tools on startup.
   plugins = { -- Enabled plugins.
      "ensure.plugin.mason",
      "ensure.plugin.lsp",
      "ensure.plugin.treesitter",
      "ensure.plugin.conform",
      -- "ensure.plugin.lint",
   },
})

-- nvim-autopairs:
require("nvim-autopairs").setup({})

-- lualine.nvim:
require("lualine").setup({})

-- chezmoi.vim:
-- <No setup required.>
