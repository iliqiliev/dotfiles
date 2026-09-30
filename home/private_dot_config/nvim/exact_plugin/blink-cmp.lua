vim.pack.add({
   { src = "https://github.com/saghen/blink.lib" },
   { src = "https://github.com/saghen/blink.cmp" },
})

local blink_cmp = require("blink.cmp")

blink_cmp.download({ match = "v*" }):pwait()

blink_cmp.setup({
   keymap = {
      preset = "default",
      ["<C-s>"] = { "show", "show_documentation", "hide_documentation" }, -- [s]how.
   },
   sources = {
      default = { "chezmoi", "lazydev", "lsp", "buffer", "snippets", "path" },
      providers = {
         chezmoi = {
            name = "Chezmoi",
            module = "chezmoi-template.blink",
         },
         lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
         },
      },
   },
})
