local M = {}
local opt = { noremap = true, silent = true }

M.core = {
  n = {
    ["<C-m>"] = { "<cmd>:%s/\r//g<CR>", "set file endings to unix (LF)"},
    ["x"] = { '"_x', "delete without yank", opts = opt},
    ["<Leader>i"] = { 'ci"', "Replace strings"},
  },
  i = {
  },
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
    ["<Leader>p"] = { "<cmd> NvimTreeFindFile <CR>", "toggle nvimtree" },


    [";p"] = {
      function()
        require("nvim-navbuddy").open()
      end, 
      "toggle NavBuddy",
    },
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

M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation
    ["]c"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },
    ["[c"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    ["<leader>hs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
    "Stage hunk",
    },
    ["<leader>hr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },
    ["<leader>hS"] = {
      function()
        require("gitsigns").stage_buffer()
      end,
      "Stage buffer",
    },
    ["<leader>hu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "Undo stage hunk",
    },
    ["<leader>hR"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      "Reset buffer",
    },
    ["<leader>hp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },
    ["<leader>hb"] = {
      function()
        package.loaded.gitsigns.blame_line { full = true }
      end,
      "Blame line",
    },
    ["<leader>tb"] = {
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      "Toggle current line blame",
    },
    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
    ["<leader>hd"] = {
      function()
        require("gitsigns").diffthis()
      end,
      "Diff against the index",
    },
    ["<leader>hD"] = {
      function()
        require("gitsigns").diffthis "~"
      end,
      "Diff against the last commit",
    },
  },
  v = {
    -- Actions
    ["<leader>hs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage hunk",
    },
    ["<leader>hr"] = {
      function ()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },
  },
  x = {
    ["ih"] = {
      function ()
        require("gitsigns").select_hunk()
      end,
      "Reset hunk",
    },
  },
  o = {
    ["ih"] = {
      function ()
        require("gitsigns").select_hunk()
      end,
      "Reset hunk",
    },
  },
}

return M
