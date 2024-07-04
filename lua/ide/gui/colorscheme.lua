local M = {}

function M.setup()
  vim.o.background = 'dark'

  local tokyonight = require('tokyonight')
  tokyonight.setup({
    style = 'storm',
    transparent = false,
    styles = {
      sidebars = 'transparent',
      floats = 'transparent',
    },
    plugins = {
      telescope = false,
      fzf = false,
    },
  })
  tokyonight.load()
end

return M
