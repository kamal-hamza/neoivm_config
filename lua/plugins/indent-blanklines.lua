return {
   "lukas-reineke/indent-blankline.nvim",
   dependencies = {
      "nvim-treesitter/nvim-treesitter",
   },
   event = { "BufReadPre", "BufNewFile" },
   main = "ibl",
   opts = {
      scope = { show_start = true, show_end = true },
      indent = { char = "┊" },
   },
}
