return {
   "neovim/nvim-lspconfig",
   config = function()
      vim.lsp.enable(require("config.languages").servers)
   end,
   event = { "BufReadPre", "BufNewFile" },
}
