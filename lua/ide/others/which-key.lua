local M = {}

function M.setup()
  require('which-key').setup({
    icons = {
      rules = false,
    },
    plugins = {
      registers = false,
    },
  })
end

return M
