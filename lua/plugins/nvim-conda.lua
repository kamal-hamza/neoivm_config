return {
    "kmontocam/nvim-conda",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function ()
        local keymap = vim.keymap
        keymap.set("n", "<leader>ce", ":CondaActivate<CR>", { desc = "List Conda Environments" })
        keymap.set("n", "<leader>cd", ":CondaDeactivate<CR>", { desc = "Deactivate Conda Environment" })
    end,
}
