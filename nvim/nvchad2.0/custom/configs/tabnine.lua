local M = {}

M.cmp = function()
  local present, cmp = pcall(require, "cmp")
  local options = {
    formatting = {
      format = function(entry, vim_item)
        if entry.source.name == 'cmp_tabnine' and entry.completion_item.data ~= nil then
            vim_item.kind = string.format("%s %s", '', ' TabNine')
        else
          local icons = require("nvchad_ui.icons").lspkind
          vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
        end

        return vim_item
      end,
    },
    -- overriding default settings
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    sources = {
      { name = "cmp_tabnine" },
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    },
  }
  cmp.setup(options)
  -- return options
end

M.tabnine = function()

  local present, tabnine = pcall(require, "cmp_tabnine.config")
  local config = {
    max_lines = 1000,
    max_num_results = 5,
    sort = true,
    run_on_every_keystroke = true,
    show_prediction_strength = false
  }
  tabnine.setup(config)
  -- return config 
end

return M
