local M = {}

function M.setup()
  require('muren').setup()
end

function M.keymaps()
  require('which-key').register({
    ['<C-s>'] = { require('muren.api').toggle_ui, 'Toggle [S]ubstitute' },
  }, { mode = { 'n', 'v' } })
end

return M
