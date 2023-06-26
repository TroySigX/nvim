local M = {}

function M.setup()
  require('trouble').setup {}
end

function M.keymaps()
  require('which-key').register({
    ['<F1>'] = { '<Esc>:TroubleToggle<CR>', 'Toggle Trouble List' }
  }, { mode = { 'n', 'i', 'v' } })
end

return M
