return {
  {
    "hrsh7th/nvim-cmp",
    opts =  require "plugins.ai.cmp".cmp(),
    config = function()
      require "plugins.ai.cmp".cmp()
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
      --     require "plugins.ai.tabnine".tabnine()
      --   end,
      -- },
    },
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      require "plugins.ai.copilot"
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
    config = function ()
      require("codeium").setup({
      })
    end
  },
}
