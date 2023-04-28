local status, npairs = pcall(require, "nvim-autopairs")
if (not status) then return end

npairs.setup({
  fast_wrap = {
    map = '<A-q>'
  }
})
