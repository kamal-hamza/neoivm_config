return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
          require('dashboard').setup {
            hide = {
              statusline = true,
              tabline = true,
              winbar = true,
            }, 
          }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    }
}