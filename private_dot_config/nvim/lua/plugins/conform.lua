return {
   "stevearc/conform.nvim",
   event = { "BufWritePre" },
   cmd = { "ConformInfo" },
   keys = {
      {
         "<leader>f",
         function()
            require("conform").format({ async = true })
         end,
         mode = "",
         desc = "Format buffer",
      },
   },

   ---@module "conform"
   ---@type conform.setupOpts
   opts = {
      default_format_opts = { lsp_format = "fallback" },
      formatters = {
         shfmt = { append_args = { "--indent", "4" } },
         tclfmt = { append_args = { "--indent", "4" } },
      },

      formatters_by_ft = {
         lua = { "stylua" },
         python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
         tcl = { "tclfmt" },
         ["_"] = { "trim_whitespace" },
      },
   },
   init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
   end,
}
