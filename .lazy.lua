---@type LazyPluginSpec[]
return {
   -- For LSP suggestions for wezterm configuration.
   {
      "https://github.com/DrKJeff16/wezterm-types",
   },
   -- For Chezmoi integration.
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
}
