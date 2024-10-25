return {
   "folke/noice.nvim",
   dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "hrsh7th/nvim-cmp",
   },
   event = "VeryLazy",
   config = function ()
      local noice = require("noice")
      noice.setup({
         lsp = {
            override = {
               ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
               ["vim.lsp.util.stylize_markdown"] = true,
               ["cmp.entry.get_documentation"] = true,
            },
         },
         cmdline = {
            enabled = true,
            view = "cmdline_popup",
            format = {
               cmdline = { pattern = "^:", icon = "", lang = "vim" },
               search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
               search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
               filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
               lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
               help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
               input = { view = "cmdline_input", icon = "󰥻 " },
            },
         },
         messages = {
            enabled = true,
            view = "notify",
            view_error = "notify",
            view_warn = "notify",
            view_history = "messages",
            view_search = "virtualtext",
         },
      })
   end,
}
