local keymap = vim.keymap

keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions "})
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<leader>sj", "<C-w>j", { desc = "Switch to bottom window" })
keymap.set("n", "<leader>sk", "<C-w>k", { desc = "Switch to top window" })
keymap.set("n", "<leader>sh", "<C-w>h", { desc = "Switch to left window" })
keymap.set("n", "<leader>sl", "<C-w>l", { desc = "Switch to right window" })
