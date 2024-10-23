local keymap = vim.keymap

keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions "})
