local M = {}

function M.setup()
  require('muren').setup()
end

function M.keymaps()
  return {
    { '<C-s>', ':MurenToggle<CR>', silent = true, desc = 'Toggle [S]ubstitute', mode = { 'n', 'v' } },
  }
end

return M
