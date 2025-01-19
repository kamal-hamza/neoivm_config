local CONFIG = require("config.theme_config")

if CONFIG.theme == "nightfox" then
	local theme = CONFIG.theme
	OPTIONS = {
		options = {
			transparent = CONFIG.transparent,
		},
	}
	require(theme).setup(OPTIONS)
	vim.cmd([[colorscheme nightfox]])
	return
end

if CONFIG.theme == "rose-pine" then
	local theme = CONFIG.theme
	OPTIONS = {
		disable_background = CONFIG.transparent,
		enable = {
			terminal = true,
			legacy_highlights = true,
			migrations = true,
		},
		styles = {
			bold = true,
			italic = true,
			transparency = CONFIG.transparent,
		},
	}
	require(theme).setup(OPTIONS)
	vim.cmd([[colorscheme rose-pine]])
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	return
end

if CONFIG.theme == "mellow" then
	vim.g.mellow_italic_functions = true
	vim.g.mellow_bold_functions = true
	vim.g.mellow_highlight_overrides = {
		["NormalNC"] = { link = "Normal" },
	}
	vim.cmd([[colorscheme mellow]])
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	return
end

if CONFIG.theme == "solarized-osaka" then
	local theme = CONFIG.theme
	OPTIONS = {
		transparent = CONFIG.transparent,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
		},
	}
	require(theme).setup(OPTIONS)
	vim.cmd([[colorscheme solarized-osaka]])
	return
end

if CONFIG.theme == "catppuccin" then
	local theme = CONFIG.theme
	OPTIONS = {
		flavour = "mocha",
		transparent_background = CONFIG.transparent,
		styles = {
			{ comments = "italic" },
			{ conditionals = "italic" },
		},
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			treesitter = true,
			notify = true,
		},
	}
	require(theme).setup(OPTIONS)
	vim.cmd([[colorscheme catppuccin]])
end

if CONFIG.theme == "onedark" then
	local theme = CONFIG.theme
	OPTIONS = {
		style = "darker",
		transparent = CONFIG.transparent,
		term_colors = true,
		code_style = {
			comments = "italic",
			keywords = "italic",
			functions = "bold",
			strings = "none",
			variables = "none",
		},
		lualine = {
			transparent = CONFIG.transparent,
		},
	}
	require(theme).setup(OPTIONS)
	vim.cmd([[colorscheme onedark]])
end

if CONFIG.theme == "cyberdream" then
	local theme = CONFIG.theme
	OPTIONS = {
		transparent = CONFIG.transparent,
		italic_comments = true,
		borderless_telescope = true,
		theme = {
			variant = "dark",
		},
		extensions = {
			telescope = true,
			treesitter = true,
			notify = true,
		},
	}
	require(theme).setup(OPTIONS)
	vim.cmd([[colorscheme cyberdream]])
end

if CONFIG.theme == "nordic" then
	local theme = CONFIG.theme
	OPTIONS = {
		transparent = {
			bg = CONFIG.transparent,
			float = CONFIG.transparent,
		},
		cursorline = {
			bold = false,
			blend = 0,
			bold_number = true,
			theme = "dark",
		},
		reduce_blue = false,
		swap_backgrounds = false,
		noice = {
			style = "flat",
		},
		telescope = {
			style = "flat",
		},
		ts_context = {
			dark_background = true,
		},
	}
	require(theme).setup(OPTIONS)
	vim.cmd([[colorscheme nordic]])
end

if CONFIG.theme == "catppuccin" then
	local theme = CONFIG.theme
	OPTIONS = {
		flavor = "mocha",
		transparent_background = CONFIG.transparent,
		no_bold = false,
		no_italic = false,
		no_underline = false,
	}
	require(theme).setup(OPTIONS)
end
