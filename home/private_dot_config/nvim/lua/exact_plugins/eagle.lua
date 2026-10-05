---@type LazyPluginSpec
return {
   "https://github.com/soulis-1256/eagle.nvim",
   event = "LspAttach",
   opts = {
      -- Hide the pop-up window borders.
      border = "none",
      -- Show the pop-up after the specified delay in miliseconds.
      render_delay = 1000,
      -- Hide the markdown headers. Also toggled with `:EagleWinToggleHeaders`.
      show_headers = false,
   },
}
