---@type LazyPluginSpec
return {
   "https://github.com/neovim/nvim-lspconfig",
   config = function()
      -- Install LSP servers.
      vim.lsp.enable(require("config.languages").servers)
      -- Lower `semantic_tokens` priority so LSP does not overwriting treesitter.
      vim.hl.priorities.semantic_tokens = 90
   end,
   event = { "BufReadPre", "BufNewFile" },
   keys = {
      {
         mode = { "n", "v" },
         "<leader>cr", -- [c]ode [r]ename.
         vim.lsp.buf.rename,
         desc = "Rename symbol",
      },
      {
         mode = { "n", "v" },
         "<leader>ca", -- [c]ode [a]ction.
         vim.lsp.buf.code_action,
         desc = "Code action",
      },
   },
}
