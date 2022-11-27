local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd
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

require "custom.colorscheme"
set.clipboard:prepend { 'unnamed', 'unnamedplus' }

cmd("filetype plugin indent on")

