vim.keymap.set(
   { "n", "v" },
   "<Leader>cf", -- [c]ode [f]ormat.
   function()
      require("conform").format()
   end,
   { desc = "Format buffer" }
)
