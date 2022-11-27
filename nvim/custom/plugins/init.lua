local pluginConfs = require "custom.plugins.configs.tabnine"

return {
  ["hrsh7th/nvim-cmp"] = {
    config = function()
      require "plugins.configs.cmp"
      require "custom.plugins.configs.tabnine".cmp()
    end,
  },
  ["tzachar/cmp-tabnine"] = {
    after = "nvim-cmp",
    run = "powershell ./install.ps1",
    requires = 'hrsh7th/nvim-cmp',
    config = function()
      require "custom.plugins.configs.tabnine".tabnine()
    end
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
    config = function()
      require "custom.plugins.configs.lspsaga"
    end,
  },
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact", "vue" },
    after = "nvim-treesitter",
    config = function()
      require "custom.plugins.configs.override".autotag()
    end,
  },
  ["windwp/nvim-autopairs"] = {
    config = function()
      require("plugins.configs.others").autopairs()
      require "custom.plugins.configs.autopairs"
    end,

  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
       require "custom.plugins.configs.null-ls"
    end,
  },
  ["editorconfig/editorconfig-vim"] = {
    after = "nvim-lspconfig"
  },
  ["neoclide/coc.nvim"] = {
    branch = "release",
--    config = function()
--      require "custom.plugins.configs.coc"
--    end,
  },
  ["nvim-telescope/telescope.nvim"] = {
    config = function()
      require "plugins.configs.telescope"
      require "custom.plugins.configs.override".telescope()
    end,
  },
  ["NvChad/ui"] = {
    override_options = {
      statusline = {
        separator_style = "arrow",
--        overriden_modules = function()
--          return require "custom.statusline"
--        end,
      },
    },
  },
  ["mfussenegger/nvim-jdtls"] = { 
    opt = true 
  },
  ["akinsho/git-conflict.nvim"] = {
    tag = "*",
    config = function()
      require "custom.plugins.configs.conflict"
    end
  },
  ["lewis6991/gitsigns.nvim"] = {
    config = function()
      -- require("plugins.configs.others").gitsigns()
      require "custom.plugins.configs.gitsigns"
    end
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    config = function()
      require "plugins.configs.treesitter"
      require "custom.plugins.configs.override".treesitter()
    end
  },
  ["kyazdani42/nvim-tree.lua"] = {
    config = function()
      require "plugins.configs.nvimtree"
      require "custom.plugins.configs.override".nvimtree()
    end
  },
  ["lukas-reineke/indent-blankline.nvim"] = {
    config = function()
      require "plugins.configs.others".blankline()
      require "custom.plugins.configs.override".blankline()
    end
  },
  ['kevinhwang91/nvim-ufo'] = {
    requires = 'kevinhwang91/promise-async',
    config = function()
      require "custom.plugins.lspconfig"
    end
  }
}
