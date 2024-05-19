-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- vim.lsp.handlers["textDocument/signatureHelp"] = require("noice").signature

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "jsonls",
  "eslint",
  "cssls",
  -- "tailwindcss",
  "pyright",
  "jdtls",
  -- "nu",
  "clangd",
  --"vuels",
   "volar",
  "solargraph",
  "r_language_server",
  "intelephense",
  -- "tsserver"
  -- "graphql",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  init_options = {
   preferences = {
     includeCompletionsForModuleExports = false,
   }
  },
  -- on_init = vim.tbl_deep_extend("force", person, someone)
  capabilities = capabilities,
}

-- vim.notify = require("noice").notify
-- vim.lsp.handlers["textDocument/hover"] = require("noice").hover
-- vim.lsp.handlers["textDocument/signatureHelp"] = require("noice").signature
