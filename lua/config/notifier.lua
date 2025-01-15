return {
	config = {
		notifier = {
			enabled = true,
			timeout = 2000,
			width = { min = 40, max = 0.4 },
			height = { min = 1, max = 0.6 },
			margin = { top = 1, right = 1, bottom = 1 },
			icons = {
				error = " ",
				warn = " ",
				info = " ",
				debug = " ",
				trace = " ",
			},
		},
		notification = {
			wo = {
				wrap = true,
				winblend = 3,
				colorcolumn = "",
				conceallevel = 2,
			},
			bo = { filetype = "snacks_notif" },
			border = "rounded",
			zindex = 1000,
			ft = "markdown",
		},
	},
}
