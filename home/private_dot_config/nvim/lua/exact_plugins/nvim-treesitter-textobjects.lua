---@module "nvim-treesitter-textobjects"

---@param query string The text object to select, e.g. `@function.outer`.
local function select_object(query)
   return function()
      require("nvim-treesitter-textobjects.select").select_textobject(
         query,
         "textobjects"
      )
   end
end

---@param function_name "goto_next_start"|"goto_previous_start"
---@param query string The text object to move to, e.g. `@function.outer`.
local function move_to(function_name, query)
   return function()
      require("nvim-treesitter-textobjects.move")[function_name](query, "textobjects")
   end
end

---@type LazyPluginSpec
return {
   "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
   keys = {
      -- Select.
      {
         mode = { "x", "o" },
         "ac", -- [a]round [c]lass.
         select_object("@class.outer"),
         desc = "class",
      },
      {
         mode = { "x", "o" },
         "ic", -- [i]nside [c]lass.
         select_object("@class.inner"),
         desc = "inner class",
      },
      {
         mode = { "x", "o" },
         "af", -- [a]round [f]unction.
         select_object("@function.outer"),
         desc = "function",
      },
      {
         mode = { "x", "o" },
         "if", -- [i]nside [f]unction.
         select_object("@function.inner"),
         desc = "inner function",
      },
      {
         mode = { "x", "o" },
         "aa", -- [a]round [a]rgument.
         select_object("@parameter.outer"),
         desc = "argument",
      },
      {
         mode = { "x", "o" },
         "ia", -- [i]nside [a]rgument.
         select_object("@parameter.inner"),
         desc = "inner argument",
      },
      -- Move.
      {
         mode = { "n", "x", "o" },
         "]C", -- Next [C]lass.
         move_to("goto_next_start", "@class.outer"),
         desc = "Next class",
      },
      {
         mode = { "n", "x", "o" },
         "[C", -- Prev [C]lass.
         move_to("goto_previous_start", "@class.outer"),
         desc = "Prev class",
      },
      {
         mode = { "n", "x", "o" },
         "]f", -- Next [f]unction.
         move_to("goto_next_start", "@function.outer"),
         desc = "Next function",
      },
      {
         mode = { "n", "x", "o" },
         "[f", -- Prev [f]unction.
         move_to("goto_previous_start", "@function.outer"),
         desc = "Prev function",
      },
      {
         mode = { "n", "x", "o" },
         "]a", -- Next [a]rgument.
         move_to("goto_next_start", "@parameter.inner"),
         desc = "Next argument",
      },
      {
         mode = { "n", "x", "o" },
         "[a", -- Prev [a]rgument.
         move_to("goto_previous_start", "@parameter.inner"),
         desc = "Prev argument",
      },
   },
   ---@type TSTextObjects.UserConfig
   opts = {
      select = {
         -- Use the text object if the cursor is not on one.
         lookahead = true,
         -- Select functions and classes linewise.
         selection_modes = {
            ["@class.outer"] = "V",
            ["@function.outer"] = "V",
         },
      },
   },
}
