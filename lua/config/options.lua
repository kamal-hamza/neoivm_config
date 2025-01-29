vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
-- normal cursor
-- vim.o.guicursor = "n-v-c-sm:block-Cursor/lCursor,i-ci-ve:block-Cursor/lCursor"
-- Block Cursor
vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.updatetime = 50
vim.opt.scrolloff = 10
vim.g.mapleader = " "
vim.opt.cursorline = true
vim.opt.number = true
-- disable copilot notifications
vim.g.copilot_no_tab_map = true
vim.g.copilot_suggestion_auto_trigger = false
