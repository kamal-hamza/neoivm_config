return {
    {
        'kevinhwang91/nvim-hlslens',
        lazy = true,
        enabled = true,
        key = {'n', '</>'},
        config = function ()
            require('hlslens').setup()
            vim.api.nvim_set_keymap('n', '<CR>', [[<cmd>lua require('hlslens').start()<CR><cmd>lua require('hlslens').next()<CR>]], { noremap = true, silent = true })
        end
    }
}
