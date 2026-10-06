---@type LazyPluginSpec
return {
   "https://github.com/nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
   config = function()
      local parsers = require("config.languages").parsers
      local group = vim.api.nvim_create_augroup("treesitter_config", { clear = true })

      for ft, languages in pairs(parsers) do
         -- Ensure the languages are installed.
         require("nvim-treesitter").install(languages)
         -- Create an `autocmd` for the specific `ft`.
         vim.api.nvim_create_autocmd("FileType", {
            callback = function()
               -- Enable treesitter-based parsing.
               vim.treesitter.start()
               -- Enable treesitter-based folds.
               vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
               vim.wo[0][0].foldmethod = "expr"
               -- Enable treesitter-based indents.
               vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
            end,
            desc = "Enable treesitter for " .. ft .. " files.",
            group = group,
            pattern = ft,
         })
      end
   end,
   lazy = false,
}
