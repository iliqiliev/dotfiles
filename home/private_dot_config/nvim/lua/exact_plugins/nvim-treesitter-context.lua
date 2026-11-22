---@module "treesitter-context"

---@type LazyPluginSpec
return {
   "https://github.com/nvim-treesitter/nvim-treesitter-context",
   event = { "BufNewFile", "BufReadPost", "BufWritePre" },
   keys = {
      {
         "[x", -- Conte[x]t.
         function()
            require("treesitter-context").go_to_context(vim.v.count1)
         end,
         desc = "Context",
      },
   },
   ---@type TSContext.UserConfig
   opts = {},
}
