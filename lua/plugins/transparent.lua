return {
    {
        "xiyaowong/transparent.nvim",
        enabled = true,
        lazy = false,
        config = function ()
            require("transparent").setup({
                groups = {
                    "Normal",
                    "NormalNC",
                    "StatusLine",
                    "StatusLineNC",
                },
                extra_groups = {
                    "NormalFloat",
                    "NvimTreeNormal", 
                },
            })
        end
    }
}