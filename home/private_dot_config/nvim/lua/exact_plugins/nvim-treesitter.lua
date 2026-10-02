---@type LazyPluginSpec
return {
   "https://github.com/nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
   config = function()
      require("nvim-treesitter").install(require("config.languages").parsers)
   end,
   lazy = false,
}
