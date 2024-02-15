return {
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = true,
        lazy = false,
        config = function ()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c_sharp", "css", "gitignore", "json", "latex", "lua", "python" },
                auto_install = true,
            })
        end
    }
}