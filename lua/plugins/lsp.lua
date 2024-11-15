return {
   "neovim/nvim-lspconfig",
   dependencies = {
      -- lsp dependencies
      "mason-lspconfig.nvim",
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "mracos/mermaid.vim",

      -- dap dependencies
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
   },
   config = function()
      local mason = require("mason")
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp = require("cmp")
      local cmp_lsp = require("cmp_nvim_lsp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      local mason_nvim_dap = require("mason-nvim-dap")
      local dap = require("dap")
      local dapui = require("dapui")
      local keymap = vim.keymap

      local capabilities = cmp_lsp.default_capabilities()

      vim.api.nvim_set_hl(0, "transparentBG", { bg = "NONE", fg = "LightGray" })

      -- setup cmp
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
         },
         mapping = cmp.mapping.preset.insert({
            ["<C-p>"] = cmp.mapping.scroll_docs(-1),
            ["<C-n>"] = cmp.mapping.scroll_docs(1),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
         }),
         window = {
            completion = cmp.config.window.bordered({ col_offset = -2, side_padding = 0, border = "rounded" }),
            documentation = cmp.config.window.bordered({ border = "rounded" }),
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

      -- setup mason
      mason.setup({
         ui = {
            icons = {
               package_installed = "✓",
               package_pending = "➜",
               package_uninstalled = "✗",
            },
            check_outdated_packages_on_open = true,
            keymaps = {
               toggle_package_expand = "e",
               install_package = "<CR>",
               update_package = "u",
               uninstall_package = "x",
            },
         },
      })

      -- setup lsp servers
      mason_lspconfig.setup({
         ensure_installed = {
            "pyright",
            "clangd",
            "lua_ls",
            "ts_ls",
            "rust_analyzer",
            "cmake",
            "ltex",
            "texlab",
            "gopls",
         },
         automatic_installation = true,
         handlers = {
            function(server_name)
               lspconfig[server_name].setup({
                  capabilities = capabilities,
               })
            end,
            ["lua_ls"] = function()
               lspconfig.lua_ls.setup({
                  capabilities = capabilities,
                  settings = {
                     Lua = {
                        diagnostics = {
                           globals = { "vim" },
                        },
                     },
                  },
               })
            end,
            ["cmake"] = function()
               lspconfig.cmake.setup({
                  capabilities = capabilities,
                  settings = {
                     CMake = {
                        filetypes = { "cmake", "CMakeLists.txt" },
                     },
                  },
               })
            end,
         },
      })

      -- mason nvim dap setup
      mason_nvim_dap.setup({
         ensure_installed = {
            "codelldb",
         },
         automatic_installation = true,
         handlers = {},
      })

      -- cpp dap setup
      dap.adapters.lldb = {
         type = "executable",
         command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
         name = "lldb",
      }

      dap.configurations.cpp = {
         {
            name = "Launch File",
            type = "lldb",
            request = "launch",
            program = function()
               return vim.fn.input("Path to Executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
         },
      }

      -- c dap setup
      dap.configurations.c = dap.configurations.cpp

      -- python dap setup
      dap.adapters.python = function(cb, config)
         if config.request == "attach" then
            --@diagnostic disable-next-line: undefined-field
            local port = (config.connect or config).port
            local host = (config.connect or config).host or "127.0.0.1"
            cb({
               type = "server",
               port = assert(port, "`connect.port` is required for a python `attach` configuration"),
               host = host,
               options = {
                  source_filetype = "python",
               },
            })
         else
            cb({
               type = "executable",
               command = "/opt/anaconda3/envs/debug/bin/python",
               args = { "-m", "debugpy.adapter" },
               options = {
                  source_filetype = "python",
               },
            })
         end
      end

      -- dap UI setup
      dapui.setup()

      -- cpp dap configuration
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

      local closeDap = function()
         dap.disconnect()
         dap.close()
         dapui.close()
      end

      -- dap keybindings
      keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      keymap.set("n", "<leader>dr", dap.continue, { desc = "Start or Continue Debugging" })
      keymap.set("n", "<leader>dc", closeDap, { desc = "Close Debug View" })
      keymap.set("n", "<leader>dR", dap.restart, { desc = "Debug Restart" })
      keymap.set("n", "<F7>", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
      keymap.set("n", "<F8>", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
      keymap.set("n", "<F9>", "<cmd>DapStepOut<CR>", { desc = "Step Out" })
      keymap.set("n", "<F10>", "<cmd>DapStepBack<CR>", { desc = "Step back" })
   end,
}
