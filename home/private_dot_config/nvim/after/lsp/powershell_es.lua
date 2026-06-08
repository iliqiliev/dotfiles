---@type vim.lsp.Config
return {
   bundle_path = vim.trim(vim.fn.system("mise where powershell-es")),
   ---@type lspconfig.settings.powershell_es
   settings = {
      powershell = {
         codeFormatting = {
            openBraceOnSameLine = true,
            ignoreOneLineBlock = true,
         },
      },
   },
}
