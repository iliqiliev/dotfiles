return {
   "https://github.com/folke/lazydev.nvim",
   cmd = "LazyDev",
   ft = "lua",
   opts = {
      library = {
         { path = "LazyVim", words = { "LazyVim" } },
         { path = "snacks.nvim", words = { "Snacks" } },
         { path = "lazy.nvim", words = { "LazyVim" } },
      },
   },
}
