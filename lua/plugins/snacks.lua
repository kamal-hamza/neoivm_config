return {
	"folke/snacks.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		local snacks = require("snacks")
		local notifier = require("config.notifier")
		snacks.setup({
			bigfile = { enabled = false },
			dashboard = { enabled = false },
			notifier = notifier.config.notifier,
			quickfile = { enabled = true },
			statuscolumn = { enabled = false },
			words = { enabled = false },
			styles = {
				notification = notifier.config.notification,
			},
		})
	end,
}
