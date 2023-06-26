local M = {}

function M.setup()
  require('sniprun').setup({
    display = {
      'Classic',
      'VirtualTextOk',
      'TempFloatingWindow',
      'NvimNotify',
    }
  })
end

function M.keymaps()
  require('which-key').register({
    r = { ':SnipRun<CR>', 'Trigger [S]nip [R]un' },
    c = { ':SnipClose<CR>', '[S]nip [C]lose' }
  }, { prefix = '<space>s', mode = { 'n', 'v' } })
end

return M
