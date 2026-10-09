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
   },
   ---@type Hover.UserConfig
   opts = {},
}
