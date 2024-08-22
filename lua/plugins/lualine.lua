return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        prority = 999,
        lazy = false,
        enabled = true,
        config = function ()
            require('lualine').setup({
                options = {
                    theme = 'onedark',
                    section_separators = '',
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
                    lualine_c = { { "filename", path = 2 }, },
                    lualine_x = { "searchcount" },
                    lualine_y = { "encoding", "fileformat", "filetype" },
                    lualine_z = { "progress", "location" },
                },
                tabline = {},
                winbar = {},
            })
        end
    }    
}
