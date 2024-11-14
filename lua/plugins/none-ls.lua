return {
	"jay-babu/mason-null-ls.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local mason_null_ls = require("mason-null-ls")
		local keymap = vim.keymap

		-- mason mason-null-ls setup
		mason_null_ls.setup({
			automatic_installation = true,
			ensure_installed = {
				"stylua",
				"clang_format",
				"black",
			},
			methods = {
				diagnostics = true,
				formatting = true,
				code_actions = true,
				hover = true,
				completion = true,
			},
			handlers = {},
		})

		-- keybinds
		keymap.set("n", "<leader>fF", vim.lsp.buf.format, { desc = "Format File" })
	end,
}
