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

local navbuddy = "nvim-navbuddy"

lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
    end
}

lspconfig.eslint.setup {
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

--[[
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      navbuddy.attach(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      utils.load_mappings("lspconfig", { buffer = bufnr })

      if client.server_capabilities.signatureHelpProvider then
        require("nvchad_ui.signature").setup(client)
      end
    end,
    capabilities = capabilities,
  }
end
]]--


-- ufo setup
--


