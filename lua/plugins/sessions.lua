return {
   "rmagatti/auto-session",
   config = function ()
      local keymap = vim.keymap
      local session = require("auto-session")
      session.setup({
         opts = {
            suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
            session_lens = {
               load_on_setup = true,
            },
         },
         keymap.set("n", "<leader>ls", "<cmd>SessionSearch<CR>", { desc = "Session Search" })
      })
   end
}
