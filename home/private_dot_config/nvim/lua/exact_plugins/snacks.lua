---@module "snacks"

---@type LazyPluginSpec
return {
   "https://github.com/folke/snacks.nvim",
   keys = {
      -- Miscellanious.
      {
         mode = { "n", "i", "v" },
         "<F1>",
         function()
            Snacks.picker.help()
         end,
         desc = "Help",
      },
      {
         "<leader>:",
         function()
            Snacks.picker.command_history()
         end,
         desc = "Command History",
      },
      -- Buffers.
      {
         "<leader>bd", -- [b]uffer [d]elete.
         function()
            Snacks.bufdelete()
         end,
         desc = "Close",
      },
      -- Explorer.
      {
         "<leader>e", -- [e]xplorer.
         function()
            Snacks.explorer()
         end,
         desc = "Explorer",
      },
      -- Find.
      {
         "<leader>fA", -- [f]ind [A]LL.
         function()
            Snacks.picker()
         end,
         desc = "All",
      },
      {
         "<leader>fb", -- [f]ind [b]uffers.
         function()
            Snacks.picker.buffers()
         end,
         desc = "Buffers",
      },
      {
         "<leader>ff", -- [f]ind [f]iles.
         function()
            Snacks.picker.files()
         end,
         desc = "Files",
      },
      {
         "<leader>fg", -- [f]ind [g]it files.
         function()
            Snacks.picker.git_files()
         end,
         desc = "Git files",
      },
      {
         "<leader>fp", -- [f]ind [p]rojects.
         function()
            Snacks.picker.projects()
         end,
         desc = "Projects",
      },
      {
         "<leader>fr", -- [f]ind [r]ecent.
         function()
            Snacks.picker.recent()
         end,
         desc = "Recent",
      },
      -- Lazygit.
      {
         "<leader>G", -- Lazy[G]it.
         function()
            Snacks.lazygit()
         end,
         desc = "LazyGit",
      },
      -- Notifications.
      {
         "<leader>n", -- [n]otifications.
         function()
            Snacks.notifier.show_history()
         end,
         desc = "Notification history",
      },
      {
         "<leader>N", -- [N]otifications.
         function()
            Snacks.picker.notifications()
         end,
         desc = "Notification search",
      },
      -- Grep.
      {
         "<leader>sb", -- [s]earch [b]uffers.
         function()
            Snacks.picker.grep_buffers()
         end,
         desc = "Search buffers",
      },
      {
         "<leader>sf", -- [s]earch [f]iles.
         function()
            Snacks.picker.grep()
         end,
         desc = "Search files",
      },
      {
         "<leader>sg", -- [s]earch [g]it files.
         function()
            Snacks.picker.git_grep()
         end,
         desc = "Search git files",
      },
      -- Terminal.
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
      indent = {
         indent = {
            -- The default is too bold.
            hl = "LineNr",
         },
         scope = {
            -- The default is a distracting bright red.
            hl = "SnacksIndent",
         },
      },
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
      quickfile = {},
      scroll = {},
      terminal = {},
      -- Styles.
      styles = {
         terminal = {
            wo = {
               -- Disable the terminal title, which shows the path to the shell.
               winbar = "",
               -- This makes the terminal background follow the editor's colorscheme.
               winhighlight = "Normal:Normal,NormalNC:NormalNC",
            },
         },
      },
   },
}
