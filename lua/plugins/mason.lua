return {
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        lazy = true,
        enabled = true,
        config = function ()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
            require("mason-lspconfig").setup()
        end
    }
}