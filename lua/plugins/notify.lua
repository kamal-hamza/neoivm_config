return {
   "rcarriga/nvim-notify",
   config = function ()
      local notify = require("notify")
      notify.setup({
         stages = "fade_in_slide_out",
         background_colour = "FloatShadow",
         timeout = 3000,
      })
      vim.notify = require("notify")
   end,
}
