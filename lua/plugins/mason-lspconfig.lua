return {
    {
        "williamboman/mason-lspconfig.nvim",
        enabled = true,
        lazy = false,
        priority = 801,
        config = function ()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "tsserver",
                    "cssls",
                    "tailwindcss",
                    "html",
                    "lua_ls",
                },
                automatic_installation = true,
            }
        end
    }
}
