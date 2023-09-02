local pluginConfs = require "custom.configs.tabnine"

return {
  -- mandatory plugins
  {
    "hrsh7th/nvim-cmp",
    opts =  require "custom.configs.tabnine".cmp(),
   config = function()
      require "custom.configs.tabnine".cmp()
    end,
    dependencies = {
      "delphinus/cmp-ctags",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "roobert/tailwindcss-colorizer-cmp.nvim",
      "ray-x/cmp-treesitter",
      {
        "tzachar/cmp-tabnine",
        build = "powershell ./install.ps1", -- windows only
        config = function()
          require "custom.configs.tabnine".tabnine()
        end,
      },
      {
        "L3MON4D3/LuaSnip",
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)
          require "custom.configs.luasnip"
        end,
      },
    },
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      require "custom.configs.copilot"
    end,
  },
  {
    "NvChad/nvterm",
    opts = {
      terminals = {
        shell = "pwsh.exe -NoLogo",
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    config = function()
      require("copilot").setup {
        suggestion = {
          enabled = false,
          keymap = {
            accept = "<C-]>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-[>",
          },
        },
        -- panel = {
          -- enabled = false,
        -- },
        server_opts_overrides = {
          trace = "verbose",
          settings = {
            advanced = {
              listCount = 3,
              inlineSuggestCount = 3,
            },
          },
        },
      }
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "SmiteshP/nvim-navbuddy",
      "kevinhwang91/nvim-ufo",
      "folke/trouble.nvim",
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
    lazy = false,
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
    config = function(_, opts)
      require "plugins.configs.nvimtree"
      require "custom.configs.override".nvimtree()
      vim.g.nvimtree_side = opts.view.side
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
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({})
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {"neovim/nvim-lspconfig"},
    opts = {

    },
  },
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
  }
}
