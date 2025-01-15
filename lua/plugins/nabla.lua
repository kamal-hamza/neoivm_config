return {
	"jbyuki/nabla.nvim",

	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>qm", ':lua require"nabla".toggle_virt()<cr>', { desc = "Toggle Math Equations" })
	end,
}
