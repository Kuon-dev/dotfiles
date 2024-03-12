-- custom.plugins.lspconfig

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "jsonls",
  "eslint",
  "cssls",
  -- "tailwindcss",
  "pyright",
  "jdtls",
  "lua_ls",
  "clangd",
  --"vuels",
   "volar",
  "solargraph",
  "r_language_server",
  "intelephense",
  -- "graphql",
}

local function custom_on_attach(client, bufnr)
  on_attach(client, bufnr)  -- Call the existing function first
  -- if not client.server_capabilities.semanticTokensProvider then
  --   print("Restart of LSP client may be needed")
  --   -- client.stop()
  --   -- vim.defer_fn(function ()
  --   --   lspconfig[client.name].setup {
  --   --     on_attach = custom_on_attach,
  --   --     capabilities = capabilities,
  --   --   }
  --   -- end, 1000)
  -- end
end

vim.notify = require("noice").notify
vim.lsp.handlers["textDocument/hover"] = require("noice").hover
vim.lsp.handlers["textDocument/signatureHelp"] = require("noice").signature

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
  }
end


local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

require("typescript-tools").setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  },
  root_dir = require('lspconfig.util').root_pattern('.git'),
  settings = {
    -- spawn additional tsserver instance to calculate diagnostics on it
    separate_diagnostic_server = true,
    -- "change"|"insert_leave" determine when the client asks the server about diagnostic
    publish_diagnostic_on = "insert_leave",
    -- array of strings("fix_all"|"add_missing_imports"|"remove_unused")
    -- specify commands exposed as code_actions
    expose_as_code_action = {},
    -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
    -- not exists then standard path resolution strategy is applied
    tsserver_path = nil,
    -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
    -- (see 💅 `styled-components` support section)
    tsserver_plugins = {},
    -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
    -- memory limit in megabytes or "auto"(basically no limit)
    tsserver_max_memory = "auto",
    -- described below
    tsserver_format_options = {},
    tsserver_file_preferences = {},
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
};

lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue", "js", "jsp" },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
})


