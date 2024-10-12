return {
    "akinsho/toggleterm.nvim",
    config = function()
        local toggleterm = require("toggleterm")
        toggleterm.setup({
            open_mapping = [[<leader>t]],
            hide_numbers = true,
            shade_terminals = true,
            start_in_insert = true,
            direction = "float",
            clear_env = false,
            float_ops = {
                border = "curved",
                title_pos = "center",
                z_index = 10000,
            },
        })
    end,
}
