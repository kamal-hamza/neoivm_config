return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        priority = 998,
        lazy = false,
        enabled = true,
        config = function ()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            vim.opt.termguicolors = true
            require("nvim-tree").setup()
            vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")
        end
    }
}