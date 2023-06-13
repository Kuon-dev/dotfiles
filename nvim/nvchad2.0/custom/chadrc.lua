-- test
local M = {}

M.ui = {
  transparency = true,
  theme = "Ayu_dark",
  theme_toggle = { "Ayu_dark", "Catppuccin" },
  statusline = {
    separator_style = "arrow",
  },
  hl_add = require("custom.highlights").new_hlgroups,
  hl_override = require("custom.highlights").overriden_hlgroups,
  tabufline = {
    lazyload = true,
  },
}

M.mappings = require "custom.mappings"

M.plugins = "custom.plugins"
return M
