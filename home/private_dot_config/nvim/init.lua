-- Variables.
vim.g.loaded_node_provider = 0 -- Disable the Node.js provider.
vim.g.loaded_perl_provider = 0 -- Disable the Perl provider.
vim.g.loaded_python3_provider = 0 -- Disable the Python 3 provider.
vim.g.loaded_ruby_provider = 0 -- Disable the Ruby provider.
vim.g.mapleader = " " -- This is used as the value of the special string `<Leader>`.
vim.g.maplocalleader = "\\" -- Like `<Leader>` but for mappings which are local to a buffer.
vim.g["chezmoi#use_tmp_buffer"] = true -- For better `chezmoi` filetype detection.

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

vim.cmd([[
   aunmenu PopUp.How-to\ disable\ mouse
   aunmenu PopUp.-2-
]]) -- Hide "How to disable mouse" from the right click menu.

-- Plugins.
if not vim.pack then
   return
end

vim.pack.add({
   "https://github.com/alker0/chezmoi.vim",
   "https://github.com/Mofiqul/adwaita.nvim",
   "https://github.com/neovim/nvim-lspconfig",
   "https://github.com/nvim-lualine/lualine.nvim",
   "https://github.com/nvim-treesitter/nvim-treesitter",
   "https://github.com/stevearc/conform.nvim",
   "https://github.com/windwp/nvim-autopairs",
})

vim.g.adwaita_transparent = true -- Makes the background transparent.
vim.cmd.colorscheme("adwaita")

require("lualine").setup({})

require("nvim-autopairs").setup({})

require("nvim-treesitter").install({
   "bash",
   "fish",
   "lua",
   "powershell",
   "python",
   "tcl",
   "toml",
})

vim.lsp.enable({
   "bashls", -- Bash/sh.
   "fish_lsp", -- Fish.
   "lua_ls", -- Lua.
   "powershell_es", -- Powershell.
   "basedpyright", -- Python.
   "tclsp", -- TCL.
   "tombi", -- TOML.
})

vim.lsp.config("powershell_es", {
   bundle_path = vim.trim(
      vim.fn.system("mise where github:PowerShell/PowerShellEditorServices")
   ),
   settings = {
      powershell = {
         codeFormatting = {
            openBraceOnSameLine = true,
            ignoreOneLineBlock = true,
         },
      },
   },
})

vim.lsp.config("tclsp", { filetypes = { "tcl" } })

require("conform").setup({
   default_format_opts = { async = true, lsp_format = "fallback" },

   formatters = {
      shfmt = { append_args = { "--indent", "4" } },
   },

   formatters_by_ft = {
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
})

vim.keymap.set(
   { "n", "v" },
   "<Leader>f",
   require("conform").format,
   { desc = "Format Buffer" }
)
