return {
   "tribela/transparent.nvim",
   event = "VimEnter",
   config = function()
      local transparent = require("transparent")
      local keymap = vim.keymap
      transparent.setup({
         auto = true,
      })
      keymap.set("n", "<leader>tv", "<cmd>TransparentToggle<CR>", { desc = "Toggle Transparent Nvim" })
   end,
}
