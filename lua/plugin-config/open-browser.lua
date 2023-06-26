local M = {}

function M.keymaps()
  require('which-key').register({
    gx = { '<Plug>(openbrowser-smart-search)', 'Open link' },
  }, { mode = { 'n', 'v' } })
end

return M
