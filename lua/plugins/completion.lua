return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-path",
		"kdheepak/cmp-latex-symbols",
		"ray-x/cmp-treesitter",
		"f3fora/cmp-spell",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
		"jmbuhr/cmp-pandoc-references",
		"jmbuhr/otter.nvim",
	},
	event = "InsertEnter",
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "luasnip" },
				{ name = "calc" },
				{ name = "spell" },
				{ name = "treesitter", keyword_length = 5, max_item_count = 3 },
				{ name = "latex_symbols" },
				{ name = "emoji" },
				{ name = "pandoc_references" },
				-- { name = "otter" },
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
			}),
			window = {
				completion = {
					border = {
						{ "󱐋", "WarningMsg" },
						{ "─", "Comment" },
						{ "╮", "Comment" },
						{ "│", "Comment" },
						{ "╯", "Comment" },
						{ "─", "Comment" },
						{ "╰", "Comment" },
						{ "│", "Comment" },
					},
					scrollbar = false,
					winblend = 0,
				},
				documentation = {
					border = {
						{ "󰙎", "DiagnosticHint" },
						{ "─", "Comment" },
						{ "╮", "Comment" },
						{ "│", "Comment" },
						{ "╯", "Comment" },
						{ "─", "Comment" },
						{ "╰", "Comment" },
						{ "│", "Comment" },
					},
					scrollbar = false,
					winblend = 0,
				},
			},
			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[Latex]",
						spell = "[Spell]",
						treesitter = "[TS]",
						calc = "[Calc]",
						emoji = "[Emoji]",
						pandoc_references = "[Ref]",
						otter = "[🦦]",
					},
				}),
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})

		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snips" } })
		luasnip.filetype_extend("quarto", { "markdown" })
		luasnip.filetype_extend("rmarkdown", { "markdown" })
	end,
}
