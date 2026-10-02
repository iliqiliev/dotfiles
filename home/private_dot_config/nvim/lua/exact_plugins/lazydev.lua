---@type LazyPluginSpec
return {
   "https://github.com/folke/lazydev.nvim",
   cmd = "LazyDev",
   ft = "lua",
   opts = {
      library = {
         { path = "lazy.nvim", words = { "Lazy" } },
      },
   },
}
