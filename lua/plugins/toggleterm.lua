return {
    {   
        "akinsho/toggleterm.nvim",
        enabled = true,
        lazy = false,
        config = function ()
        require("toggleterm").setup({
            size = 20,
            open_mapping = [[<c-t>]],
            shade_terminals = true,
            shade_factor = 2,
            persist_size = true,
            direction = "float",
            hide_numbers = true,
            shade_filetypes = {},
            close_on_exit = true,
            start_in_insert = true,
            auto_scroll = true,
            insert_mappings = true,
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Transparent",
                }
            },
        })
            vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>")
        end
    }
}
