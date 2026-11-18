---@type LazyPluginSpec
return {
   "https://github.com/lambdalisue/vim-suda",
   cmd = { "SudaRead", "SudaWrite" },
   -- Disable this plugin on Windows, since it does not work well.
   enabled = vim.fn.has("win32") == 0,
   event = { "BufNewFile", "BufReadPre" },
   init = function()
      vim.g.suda_smart_edit = 1
   end,
}
