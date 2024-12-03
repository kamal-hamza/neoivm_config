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
   OPTIONS = {
      disable_background = true,
      -- enable = {
      --    terminal = true,
      --    legacy_highlights = true,
      --    migrations = true,
      -- },
      -- styles = {
      --    bold = true,
      --    italic = true,
      --    transparency = false,
      -- },
   }
   if CONFIG.transparent then
      OPTIONS.styles.transparency = true
   end
   require(theme).setup(OPTIONS)
   vim.cmd([[colorscheme rose-pine]])
   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
   return
end

if CONFIG.theme == "mellow" then
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

if CONFIG.theme == "solarized-osaka" then
   local theme = CONFIG.theme
   OPTIONS = {
      transparent = false,
      terminal_colors = true,
      styles = {
         comments = { italic = true },
         keywords = { italic = true },
      },
   }
   if CONFIG.transparent then
      OPTIONS.transparent = true
   end
   require(theme).setup(OPTIONS)
   vim.cmd([[colorscheme solarized-osaka]])
   return
end

if CONFIG.theme == "catppuccin" then
   local theme = CONFIG.theme
   OPTIONS = {
      flavour = "mocha",
      transparent_background = false,
      styles = {
         { comments = "italic" },
         { conditionals = "italic" },
      },
      integrations = {
         cmp = true,
         gitsigns = true,
         nvimtree = true,
         treesitter = true,
         notify = true,
      },
   }
   if CONFIG.transparent then
      OPTIONS.transparent_background = true
   end
   require(theme).setup(OPTIONS)
   vim.cmd([[colorscheme catppuccin]])
end

if CONFIG.theme == "onedark" then
   local theme = CONFIG.theme
   OPTIONS = {
      style = "darker",
      transparent = false,
      term_colors = true,
      code_style = {
         comments = "italic",
         keywords = "italic",
         functions = "bold",
         strings = "none",
         variables = "none"
      },
      lualine = {
         transparent = false,
      },
   }
   if CONFIG.transparent then
      OPTIONS.transparent = true
      OPTIONS.lualine.transparent = true
   end
   require(theme).setup(OPTIONS)
   vim.cmd[[colorscheme onedark]]
end

if CONFIG.theme == "cyberdream" then
   local theme = CONFIG.theme
   OPTIONS = {
      transparent = CONFIG.transparent,
      italic_comments = true,
      borderless_telescope = true,
      theme = {
         variant = "dark",
      },
      extensions = {
         telescope = true,
         treesitter = true,
         notify = true,
      }
   }
   require(theme).setup(OPTIONS)
   vim.cmd[[colorscheme cyberdream]]
end
