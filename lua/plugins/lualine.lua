return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        priority = 999,
        lazy = false,
        enabled = true,
        config = function ()
            require("lualine").setup({
                options = {
                    section_separators = { left = '', right = '' },
                    icons_enabled = true,
                    always_divide_middle = true,
                    global_status = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = { "diff" },
                    lualine_x = { "searchcount" },
                    lualine_y = { "filename" },
                    lualine_z = { "filetype" },
                },
                tabline = {},
                winbar = {},
            })
        end
    }
}