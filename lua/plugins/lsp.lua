return {
	{
		"jmbuhr/otter.nvim",
		dev = false,
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			local otter = require("otter")

			otter.setup({
				verbose = {
					no_code_found = false,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-lspconfig.nvim",
			"williamboman/mason.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_tool_installer = require("mason-tool-installer")
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_lsp.default_capabilities()
			local lsp_flags = {
				allow_incremental_sync = true,
				debounce_text_changes = 150,
			}
			local util = require("lspconfig.util")

			local function get_quarto_resource_path()
				local function strsplit(s, delimiter)
					local result = {}
					for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
						table.insert(result, match)
					end
					return result
				end

				local f = assert(io.popen("quarto --paths", "r"))
				local s = assert(f:read("*a"))
				f:close()
				return strsplit(s, "\n")[2]
			end

			local lua_library_files = vim.api.nvim_get_runtime_file("", true)
			local lua_plugin_paths = {}
			local resource_path = get_quarto_resource_path()
			if resource_path == nil then
				vim.notify_once("quarto not found, lua library files not loaded")
			else
				table.insert(lua_library_files, resource_path .. "/lua-types")
				table.insert(lua_plugin_paths, resource_path .. "/lua-plugin/plugin.lua")
			end

			if capabilities.workspace == nil then
				capabilities.workspace = {}
				capabilities.workspace.didChangeWatchedFiles = {}
			end
			capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

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
					"omnisharp",
					"marksman",
					"asm_lsp",
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
					["ltex"] = function()
						lspconfig.ltex.setup({
							capabilities = capabilities,
							filetypes = { "tex", "plaintex", "latex" },
							settings = {
								language = "en-US",
							},
						})
					end,
					["marksman"] = function()
						lspconfig.marksman.setup({
							capabilities = capabilities,
							filetypes = { "markdown", "quarto" },
							root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
						})
					end,
					["r_language_server"] = function()
						lspconfig.r_language_server.setup({
							capabilities = capabilities,
							flags = lsp_flags,
							settings = {
								r = {
									lsp = {
										rich_documentation = false,
									},
								},
							},
						})
					end,
					["pyright"] = function()
						lspconfig.pyright.setup({
							capabilities = capabilities,
							flags = lsp_flags,
							settings = {
								python = {
									analysis = {
										autoSearchPaths = true,
										useLibraryCodeForTypes = true,
										diagnosticMode = "workspace",
									},
								},
							},
							root_dir = function(fname)
								return util.root_pattern(
									".git",
									"setup.py",
									"setup.cfg",
									"pyproject.toml",
									"requirements.txt"
								)(fname) or util.path.dirname(fname)
							end,
						})
					end,
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"jupytext",
					"tree-sitter-cli",
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local function map(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					local function vmap(keys, func, desc)
						vim.keymap.set("v", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					assert(client, "LSP client not found")
					client.server_capabilities.document_formatting = true
					map("gS", vim.lsp.buf.document_symbol, "Go to Symbols")
					map("gD", vim.lsp.buf.type_definition, "Go to Type Definition")
					map("gd", vim.lsp.buf.definition, "Go to Definition")
					map("K", vim.lsp.buf.hover, "K Hover Documentation")
					map("gh", vim.lsp.buf.signature_help, "Go to Signature Help")
					map("gI", vim.lsp.buf.implementation, "Go to Implementation")
					map("gr", vim.lsp.buf.references, "Go to References")
					map("[d", function()
						vim.diagnostic.jump({ count = 1 })
					end, "previous [d]iagnostic ")
					map("]d", function()
						vim.diagnostic.jump({ count = -1 })
					end, "next [d]iagnostic ")
					map("<leader>ll", vim.lsp.codelens.run, "Lens run")
					map("<leader>lR", vim.lsp.buf.rename, "Lsp Rename")
					map("<leader>lf", vim.lsp.buf.format, "Lsp Format")
					vmap("<leader>lf", vim.lsp.buf.format, "Lsp Format")
					map("<leader>lq", vim.diagnostic.setqflist, "Lsp Diagnostic Quickfix")
				end,
			})
		end,
	},
}
