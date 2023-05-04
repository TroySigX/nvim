vim.o.background = 'dark'

opts = {
  style = "storm",
  transparent = false,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
}

local tokyonight = require "tokyonight"
tokyonight.setup(opts)
tokyonight.load()
