-- test
local pluginConfs = require "custom.configs.tabnine"

local M = {}

M.plugins = "custom.plugins"

M.ui = {
  transparency = true,
  theme = "Ayu_dark",
  theme_toggle = { "Ayu_dark", "Catppuccin" },
  statusline = {
    theme = "default",

    separator_style = "arrow",
  },
  hl_add = require("custom.highlights").new_hlgroups,
  hl_override = require("custom.highlights").overriden_hlgroups,
}

M.mappings = require "custom.mappings"

return M
