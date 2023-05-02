vim.cmd("highlight DiagnosticUnnecessary guifg=#F0000")

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
    }
  },


}
return M
