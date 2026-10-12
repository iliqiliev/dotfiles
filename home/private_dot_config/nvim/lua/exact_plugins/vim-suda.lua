---@type LazyPluginSpec
return {
   "https://github.com/lambdalisue/vim-suda",
   cmd = { "SudaRead", "SudaWrite" },
   enabled = function()
      -- Disable this plugin on Windows, since it does not work well.
      return vim.fn.has("win32") ~= 1
   end,
   event = { "BufNewFile", "BufReadPre" },
   init = function()
      vim.g.suda_smart_edit = 1
   end,
}
