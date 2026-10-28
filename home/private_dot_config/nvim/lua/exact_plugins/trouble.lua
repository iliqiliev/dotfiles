---@type LazyPluginSpec
return {
   "https://github.com/folke/trouble.nvim",
   cmd = "Trouble",
   keys = {
      {
         "<leader>xX",
         "<cmd>Trouble diagnostics toggle<cr>",
         desc = "Diagnostics (workspace)",
      },
      {
         "<leader>xx",
         "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
         desc = "Diagnostics",
      },
      {
         "<leader>cd", -- [c]ode [d]efinition.
         "<cmd>Trouble lsp_definitions<cr>",
         desc = "Object definition",
      },
      {
         "<leader>ci", -- [c]ode [i]nformation.
         "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
         desc = "Object information",
      },
      {
         "<leader>cr", -- [c]ode [r]eferences.
         "<cmd>Trouble lsp_references<cr>",
         desc = "Object references",
      },
      {
         "<leader>cs", -- [c]ode [s]ymbols.
         "<cmd>Trouble symbols toggle focus=false<cr>",
         desc = "Symbols",
      },
      {
         "<leader>ct", -- [c]ode [t]ype.
         "<cmd>Trouble lsp_type_definitions<cr>",
         desc = "Object type definition",
      },
   },
   opts = {},
}
