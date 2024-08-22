return {
    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        dependencies = { 
            'nvim-lua/plenary.nvim',
            'telescope-fzy-native.nvim',
        },
        lazy = true,
        enabled = true,
        keys = {'n', '<C-p>'},
        config = function ()
            require('telescope').setup({
                defaults = {
                    layout_config = {
                        prompt_position = 'top',
                        preview_width = 0.5,
                    },
                    sorting_strategy = 'ascending',
                },
                pickers = {
                    find_files = {
                        previewer = true,
                    },
                    live_grep = {
                        previewer = true,
                    },
                },
            })
            require('telescope').load_extension('fzy_native')
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<C-p>', builtin.find_files, {})
            vim.keymap.set('n', '<C-h>', builtin.live_grep, {})
        end
    }
}
