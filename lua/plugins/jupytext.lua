return {
	"GCBallesteros/jupytext.nvim",
	config = function()
		local jupytext = require("jupytext")

		jupytext.setup({
			custom_language_formatting = {
				python = {
					extension = "qmd",
					style = "quarto",
					force_ft = "quarto",
				},
				r = {
					extension = "qmd",
					style = "quarto",
					force_ft = "quarto",
				},
			},
		})
	end,
}
