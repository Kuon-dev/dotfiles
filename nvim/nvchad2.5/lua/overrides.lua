local map = vim.keymap.set

map({ "n", "t" }, "<M-l>", function()
  require("nvchad.term").toggle { pos = "float", id = "nuterm", cmd = 'nu' }
end, { desc = "Terminal Toggle Floating term" })

