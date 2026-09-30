vim.pack.add({
   { src = "https://github.com/dpezto/chezmoi-template.nvim" },
})

require("chezmoi-template").setup({
   keymaps = {
      enabled = true,
      prefix = "<localleader>c",
      -- <localleader>cp - toggle the preview
      -- <localleader>ca - apply this buffer's target 
      -- <localleader>ct - open the deployed file
      -- <localleader>cs - jump to the source
      -- <localleader>ce - `:Chezmoi edit ` on the cmdline
      -- <localleader>cf - pick a source file
   },
})
