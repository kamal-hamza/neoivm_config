return {
	"ibhagwan/fzf-lua",
	config = function()
		local fzf = require("fzf-lua")
		local keymap = vim.keymap

		local function searchFiles()
			fzf.files({
				cwd = vim.fn.getcwd(),
				previewer = "builtin",
				fzf_opts = {
					["--info"] = "hidden",
				},
			})
		end

		local function grepWord()
			fzf.live_grep({
				prompt = "Find: ",
				cwd = vim.fn.getcwd(),
				fzf_opts = {
					["--info"] = "hidden",
				},
			})
		end

		local function spellCheck()
			local word = vim.fn.expand("<cword>")
			local suggestions = vim.fn.spellsuggest(word)

			if #suggestions == 0 then
				vim.notify("No spelling suggestions for: " .. word, vim.log.levels.INFO)
				return
			end
			local row, col = unpack(vim.api.nvim_win_get_cursor(0))
			local cursor_position = {
				row = row,
				col = col + 2,
			}

			fzf.fzf_exec(suggestions, {
				prompt = "Fix: " .. word .. " ",
				winopts = {
					height = 0.3,
					width = 0.4,
					row = cursor_position.row,
					col = cursor_position.col,
					border = "rounded",
				},
				actions = {
					["default"] = function(selected)
						vim.api.nvim_command("normal! ciw" .. selected[1])
						vim.notify("Replaced with: " .. selected[1], vim.log.levels.INFO)
					end,
				},
				fzf_opts = {
					["--info"] = "hidden",
				},
			})
		end

		fzf.setup({
			defaults = {
				git_icons = false,
				file_icons = false,
				color_icons = false,
			},
		})

		-- keybindings
		keymap.set("n", "<leader>ff", searchFiles, { desc = "Find Files" })
		keymap.set("n", "<leader>fp", grepWord, { desc = "Find Word in Project" })
		keymap.set("n", "<leader>fw", fzf.lgrep_curbuf, { desc = "Find Word in current Buffer" })
		keymap.set("n", "<leader>sc", spellCheck, { desc = "Spell Check Current Word" })
		keymap.set("n", "<leader>ftd", "<cmd>TodoFzfLua<CR>", { desc = "Find TODOs in Project" })
		keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Search current buffers" })
	end,
}
