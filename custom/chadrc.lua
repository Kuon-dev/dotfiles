local pluginConfs = require "custom.plugins.configs.tabnine"
local override = require "custom.override"

local M = {}

M.plugins = {
  user = require "custom.plugins",
  override = {
    ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
    ["tzachar/cmp-tabnine"] = pluginConfs.tabnine,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
  },
}

M.ui = {
  transparency = true,
  theme = "catppuccin",
  hl_add = require("custom.highlights").new_hlgroups,
  hl_override = require("custom.highlights").overriden_hlgroups,
}

M.mappings = require "custom.mappings"

return M
