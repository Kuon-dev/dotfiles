return {
  -- java
  'nvim-java/nvim-java',
  event = 'LspAttach',
  dependencies = {
    'nvim-java/lua-async-await',
    'nvim-java/nvim-java-core',
    'nvim-java/nvim-java-test',
    'nvim-java/nvim-java-dap',
    'MunifTanjim/nui.nvim',
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    {
      'williamboman/mason.nvim',
      opts = {
        registries = {
          'github:nvim-java/mason-registry',
          'github:mason-org/mason-registry',
        },
      },
    },
    config = function()
      require('nvim-java').setup({})
    end,
  },
  {
    'nvim-java/nvim-java-core',
  },
  {
    'nvim-java/nvim-java-core',
  },
  {
    'nvim-java/lua-async-await',
  },
  {
    'nvim-java/nvim-java-test',
  },
  {
    'nvim-java/nvim-java-dap',
  },
  {
    'mfussenegger/nvim-dap',
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  -- typescript
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {"neovim/nvim-lspconfig"},
    opts = {
    },
  },

}
