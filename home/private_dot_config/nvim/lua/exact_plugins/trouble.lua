---@type LazyPluginSpec
return {
   "https://github.com/folke/trouble.nvim",
   cmd = "Trouble",
   keys = {
      {
         "<leader>xx",
         "<cmd>Trouble diagnostics toggle<cr>",
         desc = "Diagnostics",
      },
      {
         "<leader>xX",
         "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
         desc = "Diagnostics (current buffer)",
      },
      {
         "<leader>cs",
         "<cmd>Trouble symbols toggle focus=false<cr>",
         desc = "Symbols",
      },
      {
         "<leader>cl",
         "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
         desc = "Definitions / references / ...",
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
