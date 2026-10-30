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
         "<cmd>Trouble lsp_definitions toggle<cr>",
         desc = "Object definition",
      },
      {
         "<leader>ci", -- [c]ode [i]nformation.
         "<cmd>Trouble lsp toggle win.position=right<cr>",
         desc = "Object information",
      },
      {
         "<leader>cR", -- [c]ode [R]eferences. `cr` is taken by LSP rename.
         "<cmd>Trouble lsp_references toggle<cr>",
         desc = "Object references",
      },
      {
         "<leader>cs", -- [c]ode [s]ymbols.
         "<cmd>Trouble symbols toggle<cr>",
         desc = "Symbols",
      },
      {
         "<leader>ct", -- [c]ode [t]ype.
         "<cmd>Trouble lsp_type_definitions toggle<cr>",
         desc = "Object type definition",
      },
   },
   opts = {},
}
