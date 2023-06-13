vim.cmd("highlight DiagnosticUnnecessary guifg=#F0000")
vim.cmd("highlight Tag guifg=#39a4ff")

local M = {

  new_hlgroups = {
    -- Neorg
    NeorgCodeBlock = {
      bg = "darkerblack"
    },

    NeorgMarkUpBold = {
      fg = "red",
      bold = true,
    },

    FakeLineNr = {
      fg = "black",
      bg = "black",
    },
  },
  overriden_hlgroups = {
    CmpDoc= {
      fg = "#e0e0e0",
      bg = "none"
    },
    DiagnosticHint = {
      fg = "#B4BEFE"
    },
    DiagnosticUnnecessary = {
      fg = "#B4BEFE"
    },
    DiffAdd = {
      fg = "green",
    },
    Function = {
      fg = "#39a4ff"
    }
  },
}


return M
