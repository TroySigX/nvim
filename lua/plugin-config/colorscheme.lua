vim.o.background = 'dark'

local tokyonight = require('tokyonight')
tokyonight.setup({
  style = 'storm',
  transparent = false,
  styles = {
    sidebars = 'transparent',
    floats = 'transparent',
  },
})
tokyonight.load()
