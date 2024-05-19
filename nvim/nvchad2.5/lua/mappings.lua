require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map("n" , ";f", "<cmd> Telescope find_files <CR>", { desc = "Find Files"})
map("n", ";f", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", ";a", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "Find All Files" })
map("n", ";r", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
map("n", ";b", "<cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
map("n", ";h", "<cmd>Telescope help_tags<CR>", { desc = "Help Page" })
map("n", ";o", "<cmd>Telescope oldfiles<CR>", { desc = "Find Old Files" })
map("n", ";k", "<cmd>Telescope keymaps<CR>", { desc = "Show Keys" })

map('n', '<C-m>', '<cmd>:%s/\r//g<CR>', { desc = 'Set file endings to unix (LF)' })
map('n', 'x', '"_x', { desc = 'Delete without yank'})
map('n', '<Leader>i', 'ci"', { desc = 'Replace strings' })
map('n', '<Leader>ri', '<cmd>TSToolsAddMissingImports<cr>', { desc = 'Add missing imports' })
map('n', '<Leader>rx', '<cmd>TSToolsRemoveUnused<cr>', { desc = 'Remove unused imports' })

-- Trouble mappings
map('n', '<Leader>ta', '<cmd>TroubleToggle<cr>', { desc = 'Toggle trouble' })
map('n', '<Leader>tq', '<cmd>TroubleToggle quickfix<cr>', { desc = 'Toggle trouble quickfix' })
map('n', '<Leader>tx', '<cmd>TroubleClose<cr>', { desc = 'Close Trouble' })
map('n', '<Leader>td', '<cmd>TroubleToggle lsp_definitions<cr>', { desc = 'Trouble Definitions' })
map('n', '<Leader>tr', '<cmd>TroubleToggle lsp_references<cr>', { desc = 'Trouble References' })

-- Undo mappings
map('n', '<C-z>', 'u', { desc = 'Undo' })
map('i', '<C-z>', 'u', { desc = 'Undo' })
map('v', '<C-z>', 'u', { desc = 'Undo' })

-- NvimTree and additional LSP mappings
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
map('n', '<C-p>', '<cmd>NvimTreeToggle<CR>', { desc = 'Open Oil Tree' })
map('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { desc = "LSP Saga Finder" })
map('n', '<Leader>ca', '<cmd>Lspsaga code_action<CR>', { desc = "Code Action" })
map('n', 'gr', '<cmd>Lspsaga rename<CR>', { desc = "Rename All Occurrences" })
map('n', 'gp', '<cmd>Lspsaga peek_definition<CR>', { desc = "Peek Definition" })
map('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', { desc = "Go to Definition" })
map('n', 'gt', '<cmd>Lspsaga peek_type_definition<CR>', { desc = "Peek Type Definition" })
map('n', '<Leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>', { desc = "Show Line Diagnostics" })
map('n', '<Leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>', { desc = "Show Buffer Diagnostics" })
map('n', '<Leader>sw', '<cmd>Lspsaga show_workspace_diagnostics<CR>', { desc = "Show Workspace Diagnostics" })
map('n', '<Leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>', { desc = "Show Cursor Diagnostics" })
map('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = "Diagnostic Jump Previous" })
map('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', { desc = "Diagnostic Jump Next" })
map('n', ';p', function() require("nvim-navbuddy").open() end, { desc = "Toggle NavBuddy" })

-- Flash mappings
map('n', '<leader>S', '<cmd>require("flash").treesitter()<CR>', { desc = "Flash Treesitter" })
map('n', '<leader>r', '<cmd>require("flash").remote()<CR>', { desc = "Remote Flash" })
map('n', '<leader>R', '<cmd>require("flash").treesitter_search()<CR>', { desc = "Treesitter Search" })
map('n', '<leader>s', '<cmd>require("flash").toggle()<CR>', { desc = "Toggle Flash Search" })
