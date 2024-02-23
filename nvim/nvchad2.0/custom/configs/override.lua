local M = {}

M.treesitter = function()
  local present, treesitter = pcall(require, "nvim-treesitter.configs")

  local options = {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<Enter>",
        node_incremental = "<Enter>",
        node_decremental = "<BS>",
      },
    },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    ensure_installed = {
      "vim",
      "java",
      "html",
      "css",
      "scss",
      "cpp",
      "javascript",
      "typescript",
      "json",
      "toml",
      "markdown",
      "c",
      "lua",
      "vue",
      "tsx",
    },
    sync_install = true,
    indent = {
      enable = true,
      disable = {},
    },
    inject = {
      enable = true, -- Enable language injection
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = true,
      languages = {
        javascript = {"html"}, -- Inject HTML into JavaScript
      },
    },
    autotag = {
      enable = true,
    }
  }
  treesitter.setup(options)
end

M.nvimtree = function()

  local present, nvimtree = pcall(require, "nvim-tree")
  local options = {
    disable_netrw = true,
    hijack_netrw = true,
    update_focused_file = {
      enable = true,
      update_root = false,
    },
    filesystem_watchers = {
      enable = true,
    },
    filters = {
      dotfiles = false,
      custom = { "node_modules" },
    },
    actions = {
      open_file = {
        resize_window = true,
      },
    },
    git = {
      enable = false,
    },
    hijack_unnamed_buffer_when_opening = true,
    hijack_cursor = true,
    view = {
      adaptive_size = false,
      side = "left",
      width = 30,
      preserve_window_proportions = true,
    },
    diagnostics = {
      enable = false,
      show_on_dirs = false,
      debounce_delay = 50,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    system_open = { cmd = "thunar" },
    sync_root_with_cwd = true,
    renderer = {
      highlight_opened_files = "name",
      highlight_git = true,
      group_empty = true,
      icons = {
        show = {
          git = true,
          file = true,
          folder = true,
          folder_arrow = true,
        },
        glyphs = {
          git = {
            unstaged = "",
            -- unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "➜",
            -- untracked = "",
            untracked = "",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    tab = {
      sync = {
        open = true,
        close = true,
      },
    },
    }
   nvimtree.setup(options)
end

M.blankline = function()

  local present, blankline = pcall(require, "indent_blankline")
  local options = {
    filetype_exclude = {
      "help",
      "terminal",
      "alpha",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "nvchad_cheatsheet",
      "lsp-installer",
      "norg",
    },
  }
  blankline.setup(options)
end

M.mason = function()

  local present, mason = pcall(require, "mason")
  local options = {
    ensure_installed = {
      -- lua stuff
      "lua-language-server",
      "stylua",

      -- web dev
      "css-lsp",
      "html-lsp",
      "json-lsp",

      -- vue
      "vetur-vls",
      "eslint-lsp",

      -- shell
      "shfmt",
      "shellcheck",
    },
  }
  mason.setup(options)
end

M.autotag = function()
  local present, autotag = pcall(require, "nvim-ts-autotag")

  if present then
    autotag.setup()
  end
end


return M
