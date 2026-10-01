return {
   "folke/snacks.nvim",
   keys = {
      {
         "<leader>e", -- [e]xplorer
         function()
            Snacks.explorer()
         end,
         desc = "Open the file explorer",
      },
   },
   lazy = false,
   priority = 1000,
   opts = {
      explorer = { enabled = true },
      notifier = { enabled = true },
      scroll = { enabled = true },
   },
}
