
local status, lualine = pcall(require, "lualine")
if (not status) then return end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'ayu_mirage',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {'NvimTree'},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 
      {
        'diagnostics',
        sections = {
          'error', 'warn', 'info', 'hint'
        },
        symbols = {
          error = '', 
          warn = '', 
          info = '',
--          hint = '⚡',
        },
        colored = true,
        update_in_insert = false,
        always_visible = false,
      }
    },
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
