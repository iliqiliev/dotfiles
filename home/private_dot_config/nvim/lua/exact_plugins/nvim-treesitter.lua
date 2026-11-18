---@type LazyPluginSpec
return {
   "https://github.com/nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
   config = function()
      local parsers = require("config.languages").parsers

      -- Ensure the parsers of all languages are installed.
      require("nvim-treesitter").install(
         vim.iter(vim.tbl_values(parsers)):flatten():totable()
      )

      vim.api.nvim_create_autocmd("FileType", {
         callback = function()
            -- Enable treesitter-based parsing.
            vim.treesitter.start()
            -- Enable treesitter-based folds.
            vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo[0][0].foldmethod = "expr"
            -- Enable treesitter-based fold text.
            vim.wo[0][0].foldtext = ""
            -- Enable treesitter-based indents.
            vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
         end,
         desc = "Enable treesitter for the configured languages.",
         group = vim.api.nvim_create_augroup("treesitter_config", { clear = true }),
         pattern = vim.tbl_keys(parsers),
      })
   end,
   lazy = false,
}
