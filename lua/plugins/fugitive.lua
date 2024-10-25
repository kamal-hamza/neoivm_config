return {
   "tpope/vim-fugitive",
   config = function ()
      local keymap = vim.keymap
      keymap.set("n", "<leader>gP", "<cmd>Git pull<CR>", { desc = "Git Pull" })
      keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git Push" })
      keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Git Commit" })
      keymap.set("n", "<leader>ga", "<cmd>Git add --all<CR>", { desc = "Git Add" })
      keymap.set("n", "<leader>gr", "<cmd>Git reset<CR>", { desc = "Git Reset" })
   end,
}
