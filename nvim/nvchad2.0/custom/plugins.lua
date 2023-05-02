local pluginConfs = require "custom.configs.tabnine"

return {
  --[[
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },
]]--
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "tzachar/cmp-tabnine"
    },
    config = function()
      require "custom.configs.tabnine".cmp()
    end,
  },
  {
    "tzachar/cmp-tabnine",
    build = "powershell ./install.ps1",
    dependencies = 'hrsh7th/nvim-cmp',
    config = function()
      require "custom.configs.tabnine".tabnine()
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "SmiteshP/nvim-navbuddy",
      "kevinhwang91/nvim-ufo",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreact", "vue" },
    after = "nvim-treesitter",
    config = function()
      require "custom.configs.override".autotag()
    end,

  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require "custom.configs.autopairs"
    end,

  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
       require "custom.configs.null-ls"
    end,
  },
  {
    "editorconfig/editorconfig-vim",
    after = "nvim-lspconfig"
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require "plugins.configs.telescope"
      require "custom.configs.override".telescope()
    end,
  },
  {
    "NvChad/ui",
    override_options = {
      statusline = {
        separator_style = "arrow",
--        overriden_modules = function()
--          return require "custom.statusline"
--        end,
      },
    },
    -- require("base46").toggle_theme();
    require("base46").load_all_highlights(),
    -- require("nvim-treesitter").highlight;
  },
  {
    "mfussenegger/nvim-jdtls",
    opt = true
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      -- require("plugins.configs.others").gitsigns()
      require "custom.configs.gitsigns"
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins.configs.treesitter"
      require "custom.configs.override".treesitter()
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "plugins.configs.nvimtree"
      require "custom.configs.override".nvimtree()
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "custom.configs.override".blankline()
    end
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require "custom.configs.ufo"
    end
  },
  {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require "custom.configs.luasnip"
    end
  },
  {
    "SmiteshP/nvim-navic"
  },
  {
    "MunifTanjim/nui.nvim"
  },
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
    "SmiteshP/nvim-navbuddy",
    requires = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
        "numToStr/Comment.nvim",        -- Optional
        "nvim-telescope/telescope.nvim" -- Optional
    },
    config = function()
      require "custom.configs.navbuddy"
    end
  },
}
