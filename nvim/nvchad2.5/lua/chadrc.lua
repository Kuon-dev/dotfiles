-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
-- test
local M = {}

M.ui = {
  transparency = true,
  -- theme = "Tokyonight",
  theme = "tokyonight",
  theme_toggle = { "catppuccin", "tokyonight" },
  statusline = {
    separator_style = "arrow",
  },
  -- hl_add = require("custom.highlights").new_hlgroups,
  -- hl_override = require("custom.highlights").overriden_hlgroups,
  tabufline = {
    lazyload = true,
  },
}

-- M.plugins = "custom.plugins"
return M
