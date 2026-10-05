---@module "snacks"

---@type LazyPluginSpec
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
      {
         "<leader>n", -- [n]otifications
         function()
            Snacks.notifier.show_history()
         end,
         desc = "Show notification history",
      },
   },
   lazy = false,
   priority = 1000,
   ---@type snacks.Config
   opts = {
      explorer = { enabled = true },
      notifier = { enabled = true },
      scroll = { enabled = true },
   },
}
