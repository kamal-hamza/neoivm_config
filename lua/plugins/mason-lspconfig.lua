return {
    {
        "williamboman/mason-lspconfig.nvim",
        enabled = true,
        config = function ()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "tsserver",
                    "cssls",
                    "tailwindcss",
                    "html",
                    "clangd",
                    "lua_ls",
                },
                automatic_installation = true,
            }
        end
    }
}