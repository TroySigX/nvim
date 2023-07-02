local M = {}

function M.keymaps()
  require('which-key').register({
    t = { '<Plug>(leap-forward-to)', 'go [t]o word forward (word after cursor)' },
    T = { '<Plug>(leap-backward-to)', 'go [T]o word backward (word before cursor)' },
  }, { mode = { 'n', 'v' } })
end

return M
