local keymap = vim.keymap

keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions " })
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- switching windows keymappings
-- down
keymap.set("n", "<A-j>", "<C-w>j", { desc = "Switch Window Down" })
-- up
keymap.set("n", "<A-k>", "<C-w>k", { desc = "Switch Window Up" })
-- left
keymap.set("n", "<A-h>", "<C-w>h", { desc = "Switch Window Left" })
-- right
keymap.set("n", "<A-l>", "<C-w>l", { desc = "Switch Window Right" })

-- terminal keymappings
keymap.set("n", "<A-t>h", "<cmd>horizontal terminal<CR>i", { desc = "Horizontal Terminal Split" })
keymap.set("n", "<A-t>v", "<cmd>vertical terminal<CR>i", { desc = "Vertical Terminal Split" })
