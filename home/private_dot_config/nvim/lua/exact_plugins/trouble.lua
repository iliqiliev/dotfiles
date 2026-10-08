---@type LazyPluginSpec
return {
   "https://github.com/folke/trouble.nvim",
   cmd = "Trouble",
   keys = {
      {
         "<leader>xx",
         "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
         desc = "Diagnostics",
      },
      {
         "<leader>xX",
         "<cmd>Trouble diagnostics toggle<cr>",
         desc = "Diagnostics (workspace)",
      },
      {
         "<leader>cs", -- [c]ode [s]ymbols.
         "<cmd>Trouble symbols toggle focus=false<cr>",
         desc = "Symbols",
      },
      {
         "<leader>ci", -- [c]ode [i]nformation.
         "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
         desc = "Object information",
      },
      {
         "<leader>xL",
         "<cmd>Trouble loclist toggle<cr>",
         desc = "Location list",
      },
      {
         "<leader>xQ",
         "<cmd>Trouble qflist toggle<cr>",
         desc = "Quickfix list",
      },
   },
   opts = {},
}
