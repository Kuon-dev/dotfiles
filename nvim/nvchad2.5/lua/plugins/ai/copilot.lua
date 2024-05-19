local present, copilot = pcall(require, "copilot")

if not present then
  return
end

copilot.setup()

vim.g.copilot_no_tab_map = true
vim.b.copilot_enabled = false
