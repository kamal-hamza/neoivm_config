return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				-- component_separators = { left = '', right = ''},
				-- section_separators = { left = '', right = ''},
				component_separators = { left = " ", right = " " },
				section_separators = { left = " ", right = " " },
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = {
					"branch",
				},
				lualine_c = {
					{
						"navic",
						color_correction = nil,
						navic_opts = nil,
					},
				},
				lualine_x = {
					"filetype",
				},
				lualine_y = {
					"diagnostics",
				},
				lualine_z = {
					{
						"filename",
						path = 1,
					},
				},
			},
			inactive_sections = {},
		})
	end,
}
