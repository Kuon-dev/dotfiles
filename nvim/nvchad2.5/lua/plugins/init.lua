local nui = require("plugins.ui.nui")
local noice = require("plugins.ui.noice")
local ai = require("plugins.ai.complete")
local telescope = require("plugins.ui.telescope")

local ui = {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = 'kevinhwang91/promise-async',
    event = "ModeChanged",
    config = function()
      local opt = require "configs.ufo"
      require('ufo').setup(opt.options)
      require('ufo').setFoldVirtTextHandler(opt.bufnr, opt.handler)
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      vim.o.foldlevel = 99
    end
  },
  nui,
  noice,
  {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      }
    end
  },
  {
    "nvim-pack/nvim-spectre",
    config = function()
      require("spectre").setup()
    end
  },
}

local lsp = {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require "configs.lspsaga"
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
  -- {
  --   "LhKipp/nvim-nu",
  --   -- do TSInstall on install
  --   build = ":TSInstall nu",
  --   event = "LspAttach",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter"
  --   },
  --   config = function()
  --     require("nu").setup({
  --       all_cmd_names = [[help commands | get name | str join "\n"]]
  --     })
  --   end
  -- }
}

local qol = {
  {
  'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({--[[ your config ]]})
    end,
  },
  {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  },
}

local dev = {
  {
    "editorconfig/editorconfig-vim",
    event = "LspAttach",
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {} -- your configuration
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-ts-autotag").setup({
        autotag = {
          enable = true,
        }
      })
    end
  },
}

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier"
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
    dependencies = {
      { "nushell/tree-sitter-nu" },
    },
    build = ":TSUpdate",
  },
  ui,
  ai,
  qol,
  lsp,
  dev,
}
