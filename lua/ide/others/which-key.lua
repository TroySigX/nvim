local M = {}

function M.setup()
  require('which-key').setup({
    preset = 'classic',
    icons = {
      rules = false,
    },
    win = {
      no_overlap = false,
    },
    plugins = {
      registers = false,
    },
  })
end

return M
