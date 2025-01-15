return {
	"HakonHarnes/img-clip.nvim",
	event = "BufEnter",
	ft = { "markdown", "quarto", "latex" },
	config = function()
		local img_clip = require("img-clip")
		local keymap = vim.keymap

		img_clip.setup({
			default = {
				dir_path = "img",
			},
			filetypes = {
				markdown = {
					url_encode_path = true,
					template = "![$CURSOR]($FILE_PATH)",
					drag_and_drop = {
						download_images = false,
					},
				},
				quarto = {
					url_encode_path = true,
					template = "![$CURSOR]($FILE_PATH)",
					drag_and_drop = {
						download_images = false,
					},
				},
			},
		})

		keymap.set("n", "<leader>ii", ":PasteImage<cr>", { desc = "Insert Image from Clipboard" })
	end,
}
