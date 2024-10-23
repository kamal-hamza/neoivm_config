return {
   "neovim/nvim-lspconfig",
   dependencies = {
      "mason-lspconfig.nvim",
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
      "onsails/lspkind.nvim",
   },
   config = function()
      local mason = require("mason")
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp = require("cmp")
      local cmp_lsp = require("cmp_nvim_lsp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      local capabilities = cmp_lsp.default_capabilities()

      vim.api.nvim_set_hl(0, "transparentBG", { bg = "NONE", fg = "LightGray" })

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
            documentation = cmp.config.window.bordered({ border = "double" }),
         },
         view = {
            entries = { name = "custom", selection_order = "near_cursor" }
         },
         formatting = {
            format = lspkind.cmp_format({
               mode = "symbol_text",
               menu = ({
                  buffer = "[Buffer]",
                  nvim_lsp = "[LSP]",
                  luasnip = "[LuaSnip]",
                  nvim_lua = "[Lua]",
                  latex_symbols = "[Latex]",
               }),
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
         })
      })

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

      mason_lspconfig.setup({
         ensure_installed = {
            "pyright",
            "clangd",
            "lua_ls",
            "ts_ls",
            "rust_analyzer",
         },
         automatic_installation = true,
         handlers = {
            function(server_name)
               lspconfig[server_name].setup({
                  capabilities = capabilities
               })
            end,
            ["lua_ls"] = function ()
               lspconfig.lua_ls.setup({
                  capabilities = capabilities,
                  settings = {
                     Lua = {
                        diagnostics = {
                           globals = { "vim" },
                        }
                     }
                  },
               })
            end,
         },
      })
   end,
}
