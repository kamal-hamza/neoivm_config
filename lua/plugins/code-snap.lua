return {
	"mistricky/codesnap.nvim",
	build = "make",
	config = function()
		local codesnap = require("codesnap")
		codesnap.setup({
			opts = {
				save_path = "~/Desktop/",
				has_breadcrumbs = true,
				bg_theme = "catppuccin",
				code_font_family = "MesloLGL Nerd Font Mono",
			},
		})
	end,
}
