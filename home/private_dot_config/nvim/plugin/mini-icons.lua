vim.pack.add({
   { src = "https://github.com/nvim-mini/mini.icons" },
})

require("mini.icons").setup({})
MiniIcons.mock_nvim_web_devicons()
MiniIcons.tweak_lsp_kind("replace")
