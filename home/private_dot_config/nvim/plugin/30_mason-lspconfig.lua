vim.pack.add({ "https://github.com/mason-org/mason-lspconfig.nvim" })
require("mason-lspconfig").setup({
   ensure_installed = {
      "basedpyright", -- Python.
      "bashls", -- Bash/sh.
      "fish_lsp", -- Fish.
      "lua_ls", -- Lua.
      "tclsp", -- TCL.
      "tombi", -- TOML.
   },
})
