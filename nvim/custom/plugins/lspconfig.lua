-- custom.plugins.lspconfig

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "clangd",
  "vuels",
  "eslint",
  "solargraph",
  "r_language_server",
  "intelephense",
}

local navbuddy = "nvim-navbuddy"

lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
    end
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- ufo setup
--


