---@module "bufferline"
---@module "snacks"

---@type LazyPluginSpec
return {
   "https://github.com/akinsho/bufferline.nvim",
   keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
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
         -- Hide the buffer close button (x) since middle mouse can be used.
         show_buffer_close_icons = false,
      },
   },
}
