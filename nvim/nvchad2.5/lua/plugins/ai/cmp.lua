local copilot_status_ok, copilot_cmp_comparators = pcall(require, "copilot_cmp.comparators")
local defaults = require("nvchad.configs.cmp")
local luasnip = require("luasnip")
-- local lspkind = require('lspkind')
-- local codeium = require "codeium"
local M = {}

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

local function get_lsp_completion_context(completion, source)
  local ok, source_name = pcall(function()
    return source.source.client.config.name
  end)
  if not ok then
    return nil
  end
  if source_name == "tsserver" or source_name == "typescript-tools" then
    return completion.detail
  elseif source_name == "pyright" then
    if completion.labelDetails ~= nil then
      return completion.labelDetails.description
    end
  end
end

local cmp = require "cmp"

M.cmp = function()
  local options = {
  completion = {
    completeopt = "menu,menuone,noinsert,noselect",
    autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
    keyword_length = 2,
  },
  experimental = {
    ghost_text = true
  },
  mapping = {
    ["<Up>"] = require("cmp").mapping.select_prev_item(),
    ["<Down>"] = require("cmp").mapping.select_next_item(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
      ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
    ["<ESC>"] = require("cmp").mapping(function(fallback)
      if require("cmp").visible() then
        require("cmp").abort()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  performance = {
    debounce = 150,
    throttle = 60,
    -- max_view_entries = 10,
    fetching_timeout = 200,
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = {
    -- {
    --   name = "copilot",
    --   max_item_count = 5,
    -- },
    {
      name = "codeium",
      max_item_count = 5,
    },
    { name = "luasnip" },
    { name = "nvim_lsp",
        max_item_count = 30,
        entry_filter = function(entry, ctx)
          return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
        end,
    },
    { name = "nvim_lua" },
    { name = "tailwind" },
    { name = "path" },
  },
  matching = {
    disallow_fuzzy_matching = true,
    disallow_fullfuzzy_matching = true,
    disallow_partial_fuzzy_matching = true,
    disallow_partial_matching = false,
    disallow_prefix_unmatching = true,
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      copilot_cmp_comparators.prioritize,
      -- Below is the default comparitor list and order for nvim-cmp
      cmp.config.compare.offset,
      -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
      },
    },
  }
  cmp.setup( vim.tbl_deep_extend("force", defaults, options))
  return {
      -- formatting = lspkind.cmp_format({
      --   before = require("tailwind-tools.cmp").lspkind_format
      -- })
  }
end

return M
