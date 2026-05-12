return {
    {
        "Mofiqul/adwaita.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.adwaita_transparent = true -- makes the background transparent
            vim.cmd('colorscheme adwaita')
        end
    }
}
