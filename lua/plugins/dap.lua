return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_python = require("dap-python")
		local dap_virtual_text = require("nvim-dap-virtual-text")
		local keymap = vim.keymap

		-- nvim dap ui listeners
		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- nvim dap virtual text setup
		dap_virtual_text.setup({
			virt_text_pos = "inline",
		})

		-- nvim dap python setup
		dap_python.setup("/opt/anaconda3/envs/debug/bin/python")

		-- nvim dap keybindings
		keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
		keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP Continue" })
		keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP Step Into" })
		keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP Step Over" })
	end,
}
