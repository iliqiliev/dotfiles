return {
    {
        'pablos123/shellcheck.nvim',
        config = function()
            require 'shellcheck-nvim'.setup {
                shellcheck_options = { '-x', '--enable=all', },
            }
        end
    }
}
