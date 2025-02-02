return {
	"folke/snacks.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		local snacks = require("snacks")
		local notifier = require("config.notifier")

		-- lsp file rename
		local prev = { new_name = "", old_name = "" }
		vim.api.nvim_create_autocmd("User", {
			pattern = "NvimTreeSetup",
			callback = function()
				local events = require("nvim-tree.api").events
				events.subscribe(events.Event.NodeRenamed, function(data)
					if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
						data = data
						snacks.rename.on_rename_file(data.old_name, data.new_name)
					end
				end)
			end,
		})

		snacks.setup({
			bigfile = { enabled = false },
			dashboard = { enabled = false },
			notifier = notifier.config.notifier,
			quickfile = { enabled = true },
			statuscolumn = { enabled = false },
			words = { enabled = false },
			styles = {
				notification = notifier.config.notification,
			},
		})
	end,
}
