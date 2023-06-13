local autocmd = vim.api.nvim_create_autocmd
local set = vim.opt

local options = {

  smartindent = true,
  smarttab = true,

  backspace = { 'start', 'eol', 'indent' },
  ff = 'unix',

  fileencoding = 'utf-8',
  encoding = 'utf-8',

  foldcolumn = '0',
  foldenable = true,

  shiftwidth = 2,
  autoread = true,
}


for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

set.clipboard:prepend { 'unnamed', 'unnamedplus' }

-- cmd("filetype plugin indent on")

for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

vim.keymap.set("i", "<M-BS>", "<Esc>cvb", { noremap = true, silent = true })
