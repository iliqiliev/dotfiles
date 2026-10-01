return {
   "https://github.com/Mofiqul/adwaita.nvim",
   config = function()
      vim.g.adwaita_transparent = true -- Makes the background transparent.
      vim.cmd("colorscheme adwaita")
   end,
   lazy = false,
   priority = 1000,
}
