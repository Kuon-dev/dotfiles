local pluginConfs = require "custom.plugins.configs.tabnine"

local M = {}

M.plugins = require "custom.plugins"
  --require "custom.plugins",
  -- ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
  -- ["tzachar/cmp-tabnine"] = pluginConfs.tabnine,
  -- ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
  -- ["nvim-telescope/telescope.nvim"] = override.telescope,


M.ui = {
  transparency = true,
  theme = "ayu-dark",
  theme_toggle = { "ayu-dark", "chadracula" },
  hl_add = require("custom.highlights").new_hlgroups,
  hl_override = require("custom.highlights").overriden_hlgroups,
}

M.mappings = require "custom.mappings"

return M
