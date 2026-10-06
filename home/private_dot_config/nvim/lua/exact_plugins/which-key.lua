---@module "which-key"

---@type LazyPluginSpec
return {
   "https://github.com/folke/which-key.nvim",
   event = "VeryLazy",
   ---@type wk.Opts
   opts = {
      spec = {
         { "<leader>b", group = "Buffer" },
         { "<leader>c", group = "Code" },
         { "<leader>f", group = "Find" },
         { "<leader>g", group = "Git" },
         { "<leader>gs", group = "Stage" },
         { "<leader>gu", group = "Unstage" },
         { "<leader>gr", group = "Reset" },
         { "<leader>s", group = "Grep" },
         { "<leader>x", group = "Diagnostics" },
      },
   },
   keys = {
      {
         "<leader>?",
         function()
            require("which-key").show({
               global = false,
            })
         end,
         desc = "Keymap helper (current buffer)",
      },
   },
}
