return {
	"benlubas/molten-nvim",
	enabled = false,
	build = ":UpdateRemotePlugins",
	init = function()
		vim.g.molten_image_provider = "image.nvim"
		vim.g.molten_output_win_max_height = 20
		vim.g.molten_auto_open_output = false
	end,
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>mi", ":MoltenInit<cr>", { desc = "Molten Init" })
		keymap.set("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<cr>", { desc = "Molten Evaluate Visual" })
		keymap.set("v", "<leader>mv", "MoltenReevaluateCell<cr>", { desc = "Molten Re-Evaluate Cell" })
	end,
}
