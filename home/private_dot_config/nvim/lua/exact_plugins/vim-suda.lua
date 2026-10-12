---@type LazyPluginSpec
return {
   "https://github.com/lambdalisue/vim-suda",
   cmd = { "SudaRead", "SudaWrite" },
   event = { "BufNewFile", "BufReadPre" },
   init = function()
      vim.g.suda_smart_edit = 1
   end,
}
