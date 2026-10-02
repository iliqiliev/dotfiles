---@type LazyPluginSpec
return {
   "neovim/nvim-lspconfig",
   config = function()
      vim.lsp.enable(require("config.languages").servers)
   end,
   event = { "BufReadPre", "BufNewFile" },
   keys = {
      {
         mode = { "n", "v" },
         "<leader>cr", -- [c]ode [r]ename.
         vim.lsp.buf.rename,
         desc = "Rename symbol",
      },
   },
}
