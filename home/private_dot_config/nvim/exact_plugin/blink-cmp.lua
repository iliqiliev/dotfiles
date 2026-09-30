vim.pack.add({
   { src = "https://github.com/saghen/blink.lib" },
   { src = "https://github.com/saghen/blink.cmp" },
})

require("blink.cmp").setup({
   keymap = {
      preset = "default",
      ["<C-s>"] = { "show", "show_documentation", "hide_documentation" }, -- [s]how.
   },
   sources = {
      per_filetype = {
         gotmpl = { "chezmoi", inherit_defaults = true },
         lua = { "lazydev", inherit_defaults = true },
      },
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
