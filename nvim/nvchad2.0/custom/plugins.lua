local ai_complete = require "custom.plugins.ai_complete"
local ui = require "custom.plugins.ui"
local lsp = require "custom.plugins.lsp"

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
  ai_complete,
  lspPlugins,
  lsp,
  qolPlugins,
  gitPlugins,
  ui,
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
    "nvim-pack/nvim-spectre",
    config = function()
      require("spectre").setup()
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
}
