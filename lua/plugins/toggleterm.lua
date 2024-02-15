return {
    {
        "akinsho/toggleterm.nvim",
        enabled = true,
        lazy = false,
        config = function ()
            require("toggleterm").setup({
                hide_numbers = true,
                shade_filetypes = {},
                close_on_exit = true,
                start_in_insert = true,
                auto_scroll = true,
                insert_mappings = true,
                border = "curved",
            })
            vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>")
        end
    }
}