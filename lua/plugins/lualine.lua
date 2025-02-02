return {
	"nvim-lualine/lualine.nvim",
	event = "UiEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")

		lualine.setup({
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "location" },
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {
					{
						"diagnostics",
						always_visible = true,
						symbols = { error = "󰅚 ", warn = " ", info = "󰋽 ", hint = "󰘥 " },
					},
				},
				lualine_z = { { "branch", always_visible = true } },
			},
		})
	end,
}
