---@module "otter"

---@type LazyPluginSpec
return {
   "https://github.com/jmbuhr/otter.nvim",
   ---@type OtterConfig
   ---@diagnostic disable: missing-fields
   opts = {
      lsp = {
         diagnostic_update_events = { "BufWritePost", "InsertLeave", "TextChanged" },
      },
   },
   ---@diagnostic enable: missing-fields
}
