local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd
local set = vim.opt

local options = {
  foldmethod = 'indent',
  foldenable = false,

  smartindent = true,
  smarttab = true,

  backspace = { 'start', 'eol', 'indent' },
  ff = 'unix',

  fileencoding = 'utf-8',
  encoding = 'utf-8',

}

for k, v in pairs(options) do
  vim.opt[k] = v 
end

autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

require "custom.colorscheme"
set.clipboard:prepend { 'unnamed', 'unnamedplus' }

cmd("filetype plugin indent on")
