return {
	"mawkler/modicator.nvim",
	dependencies = {
		"scottmckendry/cyberdream.nvim",
	},
	config = function()
		local modicator = require("modicator")
		modicator.setup({
			show_warnings = true,
		})
	end,
}
