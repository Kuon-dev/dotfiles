local pluginConfs = require "custom.plugins.configs.tabnine"

return {
  ["tzachar/cmp-tabnine"] = {
     after = "nvim-cmp",
     run = "powershell ./install.ps1",
     config = pluginConfs.tabnine
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
      require "custom.plugins.configs.autotag"
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
}
