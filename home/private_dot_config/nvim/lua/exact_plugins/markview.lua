---@module 'markview'

---@type LazyPluginSpec
return {
   "https://github.com/OXY2DEV/markview.nvim",
   lazy = false,
   ---@type markview.config
   opts = {
      ---@diagnostic disable-next-line: missing-fields
      experimental = {
         fancy_comments = true,
         prefer_nvim = true,
      },
   },
}
