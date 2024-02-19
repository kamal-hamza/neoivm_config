return {
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = true,
        lazy = false,
        onload = ":TSEnable highlight",
        config = function ()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c_sharp", "css", "gitignore", "json", "latex", "lua", "python", "cpp" },
                auto_install = true,
                highlight = {
                  enable = true,
                  use_languagetree = true,
                },
                indent = {
                  enable = true,
                }
            })
        end
    }
}