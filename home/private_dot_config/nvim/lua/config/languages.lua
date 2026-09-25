---@class Language
---@field treesitter? string -- Tree-sitter parser name for this filetype.
---@field lsp? string[]  -- LSP server name(s) to enable for this filetype.
---@field conform? conform.FiletypeFormatter

---@type table<string, Language>
local languages = {
   fish = {
      treesitter = "fish",
      lsp = { "fish_lsp" },
      conform = { lsp_format = "prefer", "fish_indent" },
   },
   lua = {
      treesitter = "lua",
      lsp = { "lua_ls" },
      conform = { "stylua" },
   },
   python = {
      treesitter = "python",
      lsp = { "ruff", "ty" },
      conform = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
   },
   sh = {
      treesitter = "bash",
      lsp = { "bashls" },
      conform = { lsp_format = "prefer", "shfmt" },
   },
   sql = {
      treesitter = "sql",
      lsp = { "sqruff" },
      conform = { lsp_format = "prefer", "sqruff" },
   },
   tcl = {
      treesitter = "tcl",
      lsp = { "tclsp" },
      conform = { lsp_format = "prefer", "tclfmt" },
   },
   toml = {
      treesitter = "toml",
      lsp = { "tombi" },
      conform = { lsp_format = "prefer", "tombi" },
   },
}

local M = {}

---@type table<string, conform.FiletypeFormatter>
M.formatters = {}
---@type string[]
M.parsers = {}
---@type string[]
M.servers = {}

for ft, language in pairs(languages) do
   M.formatters[ft] = language.conform
   M.parsers[#M.parsers + 1] = language.treesitter
   vim.list_extend(M.servers, language.lsp or {})
end

return M
