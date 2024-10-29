return {
   "lervag/vimtex",
   lazy = false,
   config = function ()
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_view_sioyek_exe = "/Applications/sioyek.app/Contents/MacOS/sioyek"
   end
}
