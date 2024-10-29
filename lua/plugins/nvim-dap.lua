return {
   "mfussenegger/nvim-dap",
   dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-treesitter/nvim-treesitter",
      "jay-babu/mason-nvim-dap.nvim",
      "williamboman/mason.nvim",
   },
   config = function ()
      local dap = require("dap")
      local dap_ui = require("dapui")
      local dap_virtual_text = require("nvim-dap-virtual-text")
      local mason_nvim_dap = require("mason-nvim-dap")

      local keymap = vim.keymap

      dap_ui.setup({})

      mason_nvim_dap.setup({
         ensure_installed = {
            "codelldb",
         },
         handlers = {}
      })

      keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      keymap.set("n", "<F6>", dap.continue, { desc = "Start or Resume Debugging" })
      keymap.set("n", "<F7>", dap.restart, { desc = "Restart Debugging" })
      keymap.set("n", "<F8>", dap.step_into, { desc = "Step Into" })
      keymap.set("n", "<F9>", dap.step_over, { desc = "Step Over" })
      keymap.set("n", "<F10>", dap.step_out, { desc = "Step Out" })
      keymap.set("n", "<F11>", dap.step_back, { desc = "Step Back" })

      dap.listeners.before.attach.dapui_config = function()
         dap_ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
         dap_ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
         dap_ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
         dap_ui.close()
      end

   end
}
