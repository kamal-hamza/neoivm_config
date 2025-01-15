return {
	"toppair/peek.nvim",
	event = { "VeryLazy" },
	build = "deno task --quiet build:fast",
	config = function()
		local peek = require("peek")
		local keymap = vim.keymap
		peek.setup({
			auto_load = false,
			close_on_bdelete = true,
			syntax = false,
			theme = "dark",
			app = "browser",
			filetype = { "markdown", "mermaid" },
			update_on_change = true,
			throttle_at = 200000,
			throttle_time = "auto",
		})
		keymap.set("n", "<leader>mpo", peek.open, { desc = "Open Markdown Preview" })
		keymap.set("n", "<leader>mpc", peek.close, { desc = "Close Markdown Preview" })
	end,
}
