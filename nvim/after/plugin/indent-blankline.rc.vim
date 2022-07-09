
" if !exists('g:loaded_indent-blankline') | finish | endif

let g:indent_blankline_use_treesitter = v:true

" let g:indent_blankline_space_char_blankline = ' '
"let g:indent_blankline_show_current_context = v:true
" let g:indent_blankline_show_current_context_start = v:true

lua << EOF

vim.opt.list = true

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#FFFFFF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

for _, keymap in pairs({
    'zo',
    'zO',
    'zc',
    'zC',
    'za',
    'zA',
    'zv',
    'zx',
    'zX',
    'zm',
    'zM',
    'zr',
    'zR',
}) do
    vim.api.nvim_set_keymap('n', keymap,  keymap .. '<CMD>IndentBlanklineRefresh<CR>', { noremap=true, silent=true })
end


require("indent_blankline").setup {
    -- space_char_blankline = " ",
    -- show_current_context = true,
    -- show_current_context_start = true,
    char_highlight_list = {
        -- "IndentBlanklineIndent1",
    },
}


EOF

