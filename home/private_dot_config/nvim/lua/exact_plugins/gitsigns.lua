---@type LazyPluginSpec
return {
   "https://github.com/lewis6991/gitsigns.nvim",
   event = { "BufNewFile", "BufReadPost", "BufWritePre" },
   keys = {
      {
         "<leader>gsh", -- [g]it [s]tage [h]unk.
         "<cmd>Gitsigns stage_hunk<cr>",
         desc = "Stage hunk",
      },
      {
         "<leader>guh", -- [g]it [u]nstage [h]unk.
         "<cmd>Gitsigns undo_stage_hunk<cr>",
         desc = "Unstage hunk",
      },
      {
         "<leader>grh", -- [g]it [r]eset [h]unk.
         "<cmd>Gitsigns reset_hunk<cr>",
         desc = "Reset hunk",
      },
      {
         "<leader>gsb", -- [g]it [s]tage [b]uffer.
         "<cmd>Gitsigns stage_buffer<cr>",
         desc = "Stage buffer",
      },
      {
         "<leader>gub", -- [g]it [u]nstage [b]uffer.
         "<cmd>Gitsigns reset_buffer_index<cr>",
         desc = "Unstage buffer",
      },
      {
         "<leader>grb", -- [g]it [r]eset [b]uffer.
         "<cmd>Gitsigns reset_buffer<cr>",
         desc = "Reset buffer",
      },
   },
   opts = {},
}
