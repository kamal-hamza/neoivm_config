return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")
        toggleterm.setup({
            opts = {
                float_ops = {
                    border = "curved",
                    title_pos = "center",
                    z_index = 10000,
                },
            },
            highlights = {
                Normal = { link = "Normal" },
                NormalNC = { link = "NormalNC" },
                NormalFloat = { link = "NormalFloat" },
                FloatBorder = { link = "FloatBorder" },
            },
            open_mapping = [[<C-t>]],
            hide_numbers = true,
            shade_terminals = true,
            start_in_insert = true,
            direction = "float",
            clear_env = false,
        })
    end,
}
