local M = {}
local opt = { noremap = true, silent = true }

M.core = {
  n = {
    ["<C-m>"] = { "<cmd>:%s/\r//g<CR>", "set file endings to unix (LF)"},
     ["x"] = { '"_x', "delete without yank", opts = opt},
  }
}

M.undo = {
  n = {
    ["<C-z>"] = { "u", "undo"},
  },
  i = {
    ["<C-z>"] = { "u", "undo"},
  },
  v = {
    ["<C-z>"] = { "u", "undo"},
  }
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-p>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    ["<C-e>"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    [";f"] = { "<cmd> Telescope find_files <CR>", "find files" },
    [";a"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    [";r"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    [";b"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    [";h"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    [";o"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    [";k"] = { "<cmd> Telescope keymaps <CR>", "show keys" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}

M.lspsaga = {
  plugin = true,

  n = {
    ["<C-j>"] = { 
      "<cmd> Lspsaga diagnostic_jump_next <CR>", 
      "jump to next diagnostic", 
    },
  },
  v = {
    ["<C-j>"] = { 
      "<cmd> Lspsaga diagnostic_jump_next <CR>", 
      "jump to next diagnostic",
    },
  },

}

return M
