return {
   "smoka7/hop.nvim",
   version = "*",
   config = function ()
      local hop = require("hop")
      local keymap = vim.keymap
      hop.setup({
         opts = {
            keys = "etovxqpdygfblzhckisuran",
         },
      })
      keymap.set("n", "<leader>hw", "<cmd>HopWord<CR>", { desc = "Hop Word" })
      keymap.set("n", "<leader>hc", "<cmd>HopChar1<CR>", { desc = "Hop Char" })
      keymap.set("n", "<leader>hp", "<cmd>HopPattern<CR>", { desc = "Hop Pattern" })
      keymap.set("n", "<leader>hl", "<cmd>HopLineStart<CR>", { desc = "Hop Line" })

   end,
}
