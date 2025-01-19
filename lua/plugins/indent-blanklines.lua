return {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local ibl = require("ibl")
		ibl.setup({
			scope = { enabled = false },
		})
	end,
}
