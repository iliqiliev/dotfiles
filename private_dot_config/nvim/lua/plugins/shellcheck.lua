return {
    {
        'pablos123/shellcheck.nvim',
        config = function()
            -- Pass options to the shellcheck command.
            require 'shellcheck-nvim'.setup {
                shellcheck_options = { '-x', '--enable=all', },
            }
        end
    }
}
