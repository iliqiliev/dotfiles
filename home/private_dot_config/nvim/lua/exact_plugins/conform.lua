---@module "conform"

---@type LazyPluginSpec
return {
   "https://github.com/stevearc/conform.nvim",
   cmd = { "ConformInfo" },
   event = { "BufWritePre" },
   keys = {
      {
         mode = { "n", "v" },
         "<Leader>cf", -- [c]ode [f]ormat.
         function()
            require("conform").format()
         end,
         desc = "Format buffer",
      },
      {
         mode = { "n", "v" },
         "<Leader>cF", -- [c]ode [F]ormat injected.
         function()
            require("conform").format({ formatters = { "injected" } })
         end,
         desc = "Format buffer (injected languages)",
      },
   },
   ---@type conform.setupOpts
   opts = {
      default_format_opts = {
         async = true,
         lsp_format = "prefer",
      },
      format_on_save = {
         timeout_ms = 1000,
      },
      formatters = {
         shfmt = {
            -- 0 for tabs (default), >0 for number of spaces.
            append_args = { "--indent", "4" },
         },
      },
      formatters_by_ft = require("config.languages").formatters,
   },
}
