local present, gitsigns= pcall(require, "gitsigns")

if not present then
  return
end

-- if (not status) then return end

local options = {
  signs = {
    add          = { hl = "DiffAdd", text = "", numhl = "GitSignsAddNr" },
    change       = { hl = "DiffChange", text = "", numhl = "GitSignsChangeNr" },
    delete       = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
    topdelete    = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
  },
  signcolumn = true,
}

local colors = {
  "highlight DiffAdd guibg=NONE guifg=#abe9b3",
  "highlight DiffChange guibg=NONE guifg=#89b4fa",
  "highlight DiffDelete guibg=NONE guifg=#f38ba8",
  "highlight DiffChangeDelete guibg=NONE guifg=#fae3b0",
}

for _, i in pairs(colors) do 
  vim.cmd(i)
end

gitsigns.setup(options)
