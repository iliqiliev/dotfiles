vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.enable({
   "basedpyright", -- Python.
   "bashls", -- Bash/sh.
   "fish_lsp", -- Fish.
   "lua_ls", -- Lua.
   "tclsp", -- TCL.
   "tombi", -- TOML.
})
