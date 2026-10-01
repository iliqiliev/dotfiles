return {
   "https://github.com/saghen/blink.cmp",
   opts = {
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
   },
   version = "1.*",
}
