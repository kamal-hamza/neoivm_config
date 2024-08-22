return {
    {
        'navarasu/onedark.nvim',
        lazy = false,
        enabled = true,
        priority = 1000,
        config = function ()
            require('onedark').setup()
            require('onedark').load()
        end
    }
}
