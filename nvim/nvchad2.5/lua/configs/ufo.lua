local status, ufo = pcall(require, "ufo")
if (not status) then return end

local M = {}

M.handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (' > %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

M.options = {
  fold_virt_text_handler = M.handler,
  open_fold_hl_timeout = 150,
  close_fold_kinds_for_ft = {'imports', 'comment'},
  provider_selector = function(bufnr, filetype, buftype)
    return {'treesitter', 'indent'}
  end
}

M.bufnr = vim.api.nvim_get_current_buf()

-- require('ufo').setFoldVirtTextHandler(bufnr, handler)
-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
-- vim.o.foldlevel = 99

return M
