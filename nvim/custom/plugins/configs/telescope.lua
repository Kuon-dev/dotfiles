local status, telescope = pcall(require, "telescope")
if (not status) then return end

telescope.setup({
  defaults = {
    layout_config = {
      -- other layout configuration here
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
  },
})
