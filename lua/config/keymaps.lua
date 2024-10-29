local keymap = vim.keymap

keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions "})
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
