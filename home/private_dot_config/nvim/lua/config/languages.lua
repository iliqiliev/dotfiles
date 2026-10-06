---@module "conform"

---@class Language
---@field treesitter string[] -- Tree-sitter parser name for this filetype.
---@field lsp? string[]  -- LSP server name(s) to enable for this filetype.
---@field conform? conform.FiletypeFormatter

---@type table<string, Language>
local languages = {
   fish = {
      treesitter = { "fish" },
      lsp = { "fish_lsp" },
      conform = { "fish_indent" },
   },
   gotmpl = {
      treesitter = { "gotmpl" },
   },
   lua = {
      treesitter = { "lua" },
      lsp = { "lua_ls" },
      conform = { "stylua", lsp_format = "fallback" },
   },
   markdown = {
      treesitter = { "markdown", "html" },
      lsp = { "rumdl" },
      conform = { "rumdl" },
   },
   python = {
      treesitter = { "python", "regex" },
      lsp = { "ruff", "ty" },
      conform = {
         "ruff_fix",
         "ruff_organize_imports",
         "ruff_format",
         lsp_format = "fallback",
      },
   },
   sh = {
      treesitter = { "bash" },
      lsp = { "bashls" },
      conform = { "shfmt" },
   },
   sql = {
      treesitter = { "sql" },
      lsp = { "sqruff" },
      conform = { "sqruff" },
   },
   tcl = {
      treesitter = { "tcl" },
      lsp = { "tclsp" },
      conform = { "tclfmt" },
   },
   toml = {
      treesitter = { "toml" },
      lsp = { "tombi" },
      conform = { "tombi" },
   },
}

local M = {}

---@type table<string, string[]>
M.parsers = {}
---@type string[]
M.servers = {}
---@type table<string, conform.FiletypeFormatter>
M.formatters = {}

for ft, language in pairs(languages) do
   M.parsers[ft] = language.treesitter
   vim.list_extend(M.servers, language.lsp or {})
   M.formatters[ft] = language.conform
end

return M
