return {
	"jay-babu/mason-null-ls.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	event = { "BufReadPre", "BufNewFile", "BufWritePre" },
	config = function()
		local mason_null_ls = require("mason-null-ls")
		local keymap = vim.keymap
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("NoneLsFormatting", {})

		-- format on save
		local on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end

		-- mason mason-null-ls setup
		mason_null_ls.setup({
			automatic_installation = true,
			ensure_installed = {
				"stylua",
				"clang_format",
				"black",
				"latexindent",
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

		null_ls.setup({
			on_attach = on_attach,
		})

		-- keybinds
		keymap.set("n", "<leader>fF", vim.lsp.buf.format, { desc = "Format File" })
	end,
}
