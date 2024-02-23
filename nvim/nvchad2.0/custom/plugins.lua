local pluginConfs = require "custom.configs.tabnine"

local defaultOverrides = {
  {
    "NvChad/ui",
    lazy = false,
    -- require("base46").toggle_theme();
    require("base46").load_all_highlights(),
    -- require("nvim-treesitter").highlight;
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
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins.configs.treesitter"
      require "custom.configs.override".treesitter()
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      -- require "plugins.configs.telescope"
      require "custom.configs.telescope"
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require "custom.configs.autopairs"
    end,
  },
}

local autoComplete = {
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
      -- {
      --   "tzachar/cmp-tabnine",
      --   build = "powershell ./install.ps1", -- windows only
      --   config = function()
      --     require "custom.configs.tabnine".tabnine()
      --   end,
      -- },
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
    "zbirenbaum/copilot.lua",
    enabled = true,
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          accept = false, -- disable built-in keymapping
        },
      })

      -- hide copilot suggestions when cmp menu is open
      -- to prevent odd behavior/garbled up suggestions
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if cmp_status_ok then
        cmp.event:on("menu_opened", function()
          vim.b.copilot_suggestion_hidden = true
        end)

        cmp.event:on("menu_closed", function()
          vim.b.copilot_suggestion_hidden = false
        end)
      end
    end,
  },
  {
    'Exafunction/codeium.nvim',
    event = { "InsertEnter", "LspAttach" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    -- event = "VeryLazy",
    config = function ()
      require("codeium").setup({
        -- vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
        -- vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
        -- vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
        -- vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
      })
      -- Change '<C-g>' here to any keycode you like.
    end
  },
}

local lspPlugins = {
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
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require "custom.configs.lspsaga"
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
}

local lspServers = {
  {
    "mfussenegger/nvim-jdtls",
    opt = true
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {"neovim/nvim-lspconfig"},
    opts = {

    },
  },
}

local qolPlugins = {
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreact", "vue", "typescriptreact" },
    after = "nvim-treesitter",
    config = function()
      require "custom.configs.override".autotag()
    end,
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
    "MunifTanjim/nui.nvim",
    lazy = false,
  },
  {
    "VonHeikemen/fine-cmdline.nvim",
    lazy = false,
    config = function()
      require('fine-cmdline').setup({
        popup = {
          position = {
            row = '50%',
            col = '50%',
          },
        },
      })
    end,
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
    'stevearc/oil.nvim',
    config = function()
      require "custom.configs.oil"
    end,
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
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
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
  },

}

local gitPlugins = {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      -- require("plugins.configs.others").gitsigns()
      require "custom.configs.gitsigns"
    end
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
        "nvim-lua/plenary.nvim",
    },
  }


}

return {
  -- mandatory plugins
  defaultOverrides,
  autoComplete,
  lspPlugins,
  lspServers,
  qolPlugins,
  gitPlugins,
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
    "editorconfig/editorconfig-vim",
    after = "nvim-lspconfig"
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function(_, opts)
      require "plugins.configs.nvimtree"
      require "custom.configs.override".nvimtree()
      vim.g.nvimtree_side = opts.view.side
    end
  },
}
