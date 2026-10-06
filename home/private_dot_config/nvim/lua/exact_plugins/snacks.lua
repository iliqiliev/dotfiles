---@module "snacks"

---@return string|string[]?
local function get_shell()
   if vim.fn.has("win32") == 1 then
      -- Override the default shell on Windows.
      return {
         "brush",
         "--rcfile",
         vim.fs.normalize("~/.config/bash/bashrc"),
      }
   end
   return nil
end

---@type LazyPluginSpec
return {
   "https://github.com/folke/snacks.nvim",
   keys = {
      {
         mode = { "n", "i", "v" },
         "<F1>",
         function()
            Snacks.picker.help()
         end,
         desc = "Help",
      },
      {
         "<leader>e", -- [e]xplorer.
         function()
            Snacks.explorer()
         end,
         desc = "File explorer",
      },
      {
         "<leader>n", -- [n]otifications.
         function()
            Snacks.notifier.show_history()
         end,
         desc = "Notification history",
      },
      {
         "<leader>t", -- [t]erminal.
         function()
            Snacks.terminal()
         end,
         desc = "Terminal",
      },
   },
   lazy = false,
   priority = 1000,
   ---@type snacks.Config
   opts = {
      explorer = {},
      input = {},
      notifier = {},
      picker = {
         sources = {
            explorer = {
               -- This disables the title.
               -- `bufferline.nvim` sets a title on the winbar.
               title = "",
            },
         },
      },
      scroll = {},
      terminal = { shell = get_shell() },
   },
}
