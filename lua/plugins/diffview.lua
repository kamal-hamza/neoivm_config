return {
   "sindrets/diffview.nvim",
   config = function()
      local keymap = vim.keymap
      keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<CR>", { desc = "Diff View Open" })
   end,
}
