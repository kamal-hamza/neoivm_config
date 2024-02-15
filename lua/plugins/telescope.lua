return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "telescope-fzy-native.nvim",
        },
        prority = 997,
        lazy = true,
        enabled = true,
        keys = { "n", "<C-p>" },
        config = function ()
            require("telescope").setup()
            require('telescope').load_extension('fzy_native')
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<C-p>', builtin.find_files, {})
            vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
        end
    }
}