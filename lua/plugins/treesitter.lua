return {
   "nvim-treesitter/nvim-treesitter",
   config = function()
      local treesitter_config = require("nvim-treesitter.configs")
      treesitter_config.setup({
         ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "cpp",
            "python",
            "markdown",
         },
         auto_install = true,
         highlight = {
            enable = true,
         },
         indent = {
            enable = true,
         },
      })
   end,
}
