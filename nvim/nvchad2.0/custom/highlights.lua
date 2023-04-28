
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
    AlphaHeader = {
      fg = "blue",
    },
    DiffAdd = {
      fg = "green",
    }
  },


}
return M
