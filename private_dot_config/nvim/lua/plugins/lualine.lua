return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup {
                options = {
                    theme = "adwaita",
                }
            }
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" }
    }
}
