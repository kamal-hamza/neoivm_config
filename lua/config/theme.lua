local CONFIG = require("config.theme_config")

if CONFIG.theme == "nightfox" then
   local theme = CONFIG.theme
   if CONFIG.transparent then
      OPTIONS = {
         options = {
            transparent = true,
         }
      }
      require(theme).setup(OPTIONS)
      vim.cmd([[colorscheme nightfox]])
      return
   end
end

if CONFIG.theme == "rose-pine" then
   local theme = CONFIG.theme
   if CONFIG.transparent then
      OPTIONS = {
         enable = {
            terminal = true,
            legacy_highlights = true,
            migrations = true,
         },
         styles = {
            bold = true,
            italic = true,
            transparency = true,
         },
      }
      require(theme).setup(OPTIONS)
      vim.cmd([[colorscheme rose-pine]])
      return
   end
end

if CONFIG.theme == "mellow" then
   local theme = CONFIG.theme
   if CONFIG.transparent then
      vim.g.mellow_italic_functions = true
      vim.g.mellow_bold_functions = true
      vim.g.mellow_highlight_overrides = {
         ["NormalNC"] = { link = "Normal" }
      }
      vim.cmd([[colorscheme mellow]])
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      return
   end
end
