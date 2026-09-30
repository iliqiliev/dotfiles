vim.pack.add({
   { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

local absolute_path_with_tilde = 3

require("lualine").setup({
   options = {
      globalstatus = true, -- Only one statusline for all panes.
   },
   sections = { -- The statusline is at the bottom.
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {},
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
   },
   tabline = { -- The tabline is at the top.
      lualine_a = { "buffers" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "tabs" },
   },
   winbar = { -- The winbar is a buffer-specific line on top of each pane.
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { "filename", path = absolute_path_with_tilde } },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
   },
})
