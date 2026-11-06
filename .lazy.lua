---@module "blink.cmp"

---@type LazyPluginSpec[]
return {
   -- LSP suggestions for wezterm configuration.
   {
      "https://github.com/DrKJeff16/wezterm-types",
   },
   -- Chezmoi integration.
   {
      "https://github.com/dpezto/chezmoi-template.nvim",
      lazy = false,
      opts = {
         keymaps = {
            enabled = true,
            prefix = "<localleader>c",
            -- <localleader>cp - Toggle the preview.
            -- <localleader>ca - Apply this buffer's target.
            -- <localleader>ct - Open the deployed file.
            -- <localleader>cs - Jump to the source.
            -- <localleader>ce - `:Chezmoi edit ` on the cmdline.
            -- <localleader>cf - Pick a source file.
         },
      },
   },
   -- Chezmoi source for `blink.cmp`.
   {
      "https://github.com/saghen/blink.cmp",
      ---@param opts blink.cmp.Config
      opts = function(_, opts)
         opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
            providers = {
               chezmoi = {
                  name = "Chezmoi",
                  module = "chezmoi-template.blink",
                  score_offset = 100,
               },
            },
         })

         local default = opts.sources.default
         assert(
            type(default) == "table",
            "blink.cmp: Config `sources.default` is not a table!"
         )
         table.insert(default, "chezmoi")
      end,
   },
}
