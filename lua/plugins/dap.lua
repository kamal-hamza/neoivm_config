return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-treesitter/nvim-treesitter",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_python = require("dap-python")
		local dap_virtual_text = require("nvim-dap-virtual-text")
		local keymap = vim.keymap
		local mason_nvim_dap = require("mason-nvim-dap")

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

		-- mason nvim dap setup
		mason_nvim_dap.setup({
			ensure_installed = {
				"debugpy",
				"cpptools",
			},
			automatic_installation = true,
		})

		-- cpp dap setup
		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "/Users/hkamal/.vscode/extensions/ms-vscode.cpptools-1.22.11-darwin-arm64/debugAdapters/bin/OpenDebugAD7",
		}

		dap.configurations.cpp = {
			{
				name = "File",
				type = "cppdbg",
				request = "Launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
			{
				name = "Attach to gdbserver :1234",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "localhost:1234",
				miDebuggerPath = "/usr/bin/gdb",
				cwd = "${workspaceFolder}",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
			},
		}

		-- nvim dap python setup
		dap_python.setup("/opt/anaconda3/envs/debug/bin/python")

		-- nvim dap keybindings
		keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
		keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP Continue" })
		keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP Step Into" })
		keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP Step Over" })
	end,
}
