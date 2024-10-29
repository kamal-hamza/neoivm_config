return {
   "nvim-lualine/lualine.nvim",
   dependencies = {
      "nvim-tree/nvim-web-devicons",
   },
   config = function()
      local lualine = require("lualine")
      lualine.setup({
         options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
         },
         sections = {
            lualine_c = {
               {
                  "navic",
                  color_correction = nil,
                  navic_opts = nil,
               },
            },
         },
      })
   end,
}
