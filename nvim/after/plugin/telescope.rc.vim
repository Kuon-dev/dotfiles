if !exists('g:loaded_telescope') | finish | endif

nnoremap  <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap  <silent> ;r <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')
local action_state = require "telescope.actions.state"
local utils = require('telescope.utils')
local builtin = require ('telescope.builtin')

telescope.load_extension "file_browser"

local telescope_custom_actions = {}

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser",
  { noremap = true }
)

telescope.setup{
  defaults = {
   path_display = function(opts, path)
      local tail = utils.path_tail(path)
      -- local preview = utils.path_smart(path)
      -- local preview = utils.path_shorten(path)
      -- return string.format("%s (%s)", tail, path) , { { { 1, #tail }, "Constant" } }
      return string.format("%s (%s)", tail, path) 
    end,
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<C-h>"] = "which_key",
      },
    },
    preview = {
      timeout = 500,
      msg_bg_fillchar = "",
    },
    multi_icon = " ",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    color_devicons = true,
    layout_strategy = 'bottom_pane',
    -- layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        width_padding = 0.4,
        height_padding = 0.1,
        preview_width = 0.35,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.7,
      },
    },
  },
  pickers = {
    find_files = {
    }
  },
  extensions = {
    file_browser = {
      hidden = true,
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      cwd_to_path = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    ["ui-select"] = {
      require("telescope.themes").get_cursor(),
    },

--     fzf = {
--       fuzzy = true, -- false will only do exact matching
--       override_generic_sorter = true,
--       override_file_sorter = true,
--       case_mode = "smart_case", -- this is default
--     },
  },
}

require("telescope").load_extension "file_browser"
-- require("telescope").load_extension "fzf"
require("telescope").load_extension "ui-select"
EOF
