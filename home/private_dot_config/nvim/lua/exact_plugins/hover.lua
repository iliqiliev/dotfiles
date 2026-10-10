---@module "hover"

---@type LazyPluginSpec
return {
   "https://github.com/lewis6991/hover.nvim",
   keys = {
      {
         "K",
         function()
            require("hover").open()
         end,
         desc = "Hover",
      },
      {
         "gK",
         function()
            require("hover").enter()
         end,
         desc = "Enter hover pop-up",
      },
      {
         "<C-n>",
         function()
            require("hover").switch("next")
         end,
         desc = "Hover (next source)",
      },
      {
         "<C-p>",
         function()
            require("hover").switch("previous")
         end,
         desc = "Hover (previous source)",
      },
   },
   ---@type Hover.UserConfig
   opts = {},
}
