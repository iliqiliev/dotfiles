---@module "bufferline"
---@module "snacks"

---@type LazyPluginSpec
return {
   "https://github.com/akinsho/bufferline.nvim",
   keys = {
      { "<leader>bf", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" }, -- [b]uffer [f]ind
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
   },
   lazy = false,
   ---@type bufferline.UserConfig
   opts = {
      options = {
         close_command = function(n)
            Snacks.bufdelete(n)
         end,
         middle_mouse_command = function(n)
            Snacks.bufdelete(n)
         end,
         right_mouse_command = function() end,
         -- Offset the bufferline by Snacks' explorer.
         offsets = {
            {
               filetype = "snacks_layout_box",
               text = "Explorer",
               highlight = "SnacksPickerTitle",
               separator = true,
            },
         },
         -- Hide the buffer close button (x) since middle mouse can be used.
         show_buffer_close_icons = false,
      },
   },
}
