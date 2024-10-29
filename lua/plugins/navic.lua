return {
   "SmiteshP/nvim-navic",
   config = function()
      local navic = require("nvim-navic")
      local icons = {
         ChevronRight = "",
      }
      navic.setup({
         icons = {
            Array = " ",
            Boolean = " ",
            Class = " ",
            Color = " ",
            Constant = " ",
            Constructor = " ",
            Enum = " ",
            EnumMember = " ",
            Event = " ",
            Field = " ",
            File = " ",
            Folder = "󰉋 ",
            Function = " ",
            Interface = " ",
            Key = " ",
            Keyword = " ",
            Method = " ",
            -- Module = " ",
            Module = " ",
            Namespace = " ",
            Null = "󰟢 ",
            Number = " ",
            Object = " ",
            Operator = " ",
            Package = " ",
            Property = " ",
            Reference = " ",
            Snippet = " ",
            String = " ",
            Struct = " ",
            Text = " ",
            TypeParameter = " ",
            Unit = " ",
            Value = " ",
            Variable = " ",
         },
         highlight = true,
         lsp = {
            auto_attach = true,
            preference = {
               "templ",
            },
         },
         click = true,
         seperator = " " .. icons.ChevronRight .. " ",
         depth_limit = 0,
         depth_limit_indicator = "..",
      })
   end,
}
