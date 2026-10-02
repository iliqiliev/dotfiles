---@type LazyPluginSpec
return {
   "https://github.com/folke/which-key.nvim",
   event = "VeryLazy",
   opts = {},
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
