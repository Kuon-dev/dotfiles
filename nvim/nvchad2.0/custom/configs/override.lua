local M = {}

M.telescope = function()
  local present, telescope = pcall(require, "telescope")
  local options = {
    defaults = {
      layout_config = {
      }
    },
    pickers = {
      find_files = {
        theme = "ivy",
      }
    },
  }
  telescope.setup(options)
end

M.autotag = function()
  local present, autotag = pcall(require, "nvim-ts-autotag")

  if present then
    autotag.setup()
  end
end

M.treesitter = function()
  local present, treesitter = pcall(require, "nvim-treesitter.configs")

  local options = {
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
      "ruby",
      "php",
    },
    sync_install = true,
    autotag = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = {},
    },
  }
  treesitter.setup(options)
end

M.nvimtree = function()

  local present, nvimtree = pcall(require, "nvim-tree")
  local options = {
    git = {
      enable = false,
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

return M
