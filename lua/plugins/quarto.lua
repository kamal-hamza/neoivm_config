return {
	"quarto-dev/quarto-nvim",
	dependencies = {
		"jmbuhr/otter.nvim",
	},
	config = function()
		local quarto = require("quarto")
		local keymap = vim.keymap

		quarto.setup()
		keymap.set("n", "<leader>qp", "<cmd>QuartoPreview<CR>", { desc = "Quarto Preview" })
	end,
}
