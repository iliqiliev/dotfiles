return {
   "https://github.com/stevearc/conform.nvim",
   cmd = { "ConformInfo" },
   event = { "BufWritePre" },
   keys = {
      {
         mode = "",
         "<Leader>cf", -- [c]ode [f]ormat.
         function()
            require("conform").format()
         end,
         desc = "Format buffer",
      },
   },
   opts = {
      default_format_opts = {
         async = true,
         lsp_format = "prefer",
      },
      format_on_save = { timeout_ms = 500 },
      formatters = {
         shfmt = { append_args = { "--indent", "4" } }, -- 0 for tabs (default), >0 for number of spaces.
         injected = {
            condition = function(_, ctx)
               return vim.bo[ctx.buf].filetype ~= "gotmpl"
            end,
         },
      },
      formatters_by_ft = vim.tbl_extend(
         "error",
         require("config.languages").formatters,
         {
            -- https://github.com/stevearc/conform.nvim/blob/master/doc/advanced_topics.md#injected-language-formatting-code-blocks
            ["*"] = { "injected" },
            -- For filetypes without a defined formatter.
            ["_"] = { "trim_whitespace" },
         }
      ),
   },
}
