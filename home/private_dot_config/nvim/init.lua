-- Variables.
vim.g.mapleader = " " -- This is used as the value of the special string <Leader>.
vim.g.maplocalleader = "\\" -- Like <Leader> but for mappings which are local to a buffer.
vim.g["chezmoi#use_tmp_buffer"] = true -- For better chezmoi filetype detection.

-- Options.
vim.opt.expandtab = true -- Use the appropriate number of spaces to insert a <Tab>.
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent.
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for.
vim.opt.wildmode = "longest:full,full" -- Completion mode used for the 'wildchar'.

-- Plugins.
local plugins = {
   "https://github.com/alker0/chezmoi.vim",
   "https://github.com/mason-org/mason.nvim",
   "https://github.com/Mofiqul/adwaita.nvim",
   "https://github.com/neovim/nvim-lspconfig",
   "https://github.com/noirbizarre/ensure.nvim",
   "https://github.com/nvim-lualine/lualine.nvim",
   "https://github.com/nvim-treesitter/nvim-treesitter",
   "https://github.com/stevearc/conform.nvim",
   "https://github.com/windwp/nvim-autopairs",
}

if not vim.pack then
   vim.notify(
      "Neovim version is older than 0.12, plugins will not be installed.",
      vim.log.levels.WARN
   )
   return
end

vim.pack.add(plugins)

-- adwaita.nvim:
vim.g.adwaita_transparent = true -- Makes the background transparent.
vim.cmd("colorscheme adwaita")

-- lualine.nvim:
require("lualine").setup({})

-- nvim-autopairs:
require("nvim-autopairs").setup({})

-- mason.nvim:
require("mason").setup()

-- conform.nvim:
require("conform").setup({
   default_format_opts = { async = true, lsp_format = "fallback" },
   formatters = {
      shfmt = { append_args = { "--indent", "4" } },
   },
})
vim.keymap.set(
   { "n", "v" },
   "<Leader>f",
   require("conform").format,
   { desc = "Format Buffer" }
)

-- ensure.nvim:
require("ensure").setup({
   install = true, -- Install tools on startup.
   plugins = { -- Enabled plugins.
      "ensure.plugin.mason",
      "ensure.plugin.treesitter",
      "ensure.plugin.conform",
      "ensure.plugin.lsp",
      -- "ensure.plugin.lint",
   },

   -- nvim-treesitter parsers:
   parsers = {
      "bash",
      "fish",
      "lua",
      "powershell",
      "python",
      "tcl",
      "toml",
   },

   -- conform.nvim formatters:
   formatters = {
      sh = { lsp_format = "prefer", "shfmt" },
      fish = { lsp_format = "prefer", "fish_indent" },
      lua = { "stylua" },
      ps1 = { lsp_format = "prefer" },
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
      tcl = { lsp_format = "prefer", "tclfmt" },
      toml = { lsp_format = "prefer", "tombi" },
      ["*"] = { "injected" }, -- https://github.com/stevearc/conform.nvim/blob/master/doc/advanced_topics.md#injected-language-formatting-code-blocks
      ["_"] = { "trim_whitespace" }, -- For filetypes without a defined formatter.
   },

   -- nvim-lspconfig servers:
   lsp = {
      enable = { -- Servers to enable.
         "bashls", -- Bash/sh.
         "fish_lsp", -- Fish.
         "lua_ls", -- Lua.
         "powershell_es", -- Powershell.
         "basedpyright", -- Python.
         "tclsp", -- TCL.
         "tombi", -- TOML.
      },
      powershell_es = {
         bundle_path = vim.fn.stdpath("data")
            .. "/mason/packages/powershell-editor-services",
         settings = {
            powershell = {
               codeFormatting = {
                  openBraceOnSameLine = true,
                  ignoreOneLineBlock = true,
               },
            },
         },
      },
   },
})
