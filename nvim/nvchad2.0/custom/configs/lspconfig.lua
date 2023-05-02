-- custom.plugins.lspconfig

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "jsonls",
  "eslint",
  "cssls",
  "tsserver",
  "tailwindcss",

  "clangd",
  --"vuels",
   "volar",
  "solargraph",
  "r_language_server",
  "intelephense",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
