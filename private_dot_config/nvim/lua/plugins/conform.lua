return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
            tcl = { "tclfmt" },
            ["_"] = { "trim_whitespace" },
        },
        default_format_opts = { lsp_format = "fallback" }, -- Set default options
        format_on_save = { timeout_ms = 500 },
        formatters = {
            shfmt = { append_args = { "--indent", "4" } },
            tclfmt = { append_args = { "--indent", "4" } },
        },
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
