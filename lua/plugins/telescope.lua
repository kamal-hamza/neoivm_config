return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "telescope-fzy-native.nvim",
        },
        prority = 997,
        lazy = false,
        enabled = true,
        config = function ()
            require("telescope").setup()
            require('telescope').load_extension('fzy_native')
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        end
    }
}