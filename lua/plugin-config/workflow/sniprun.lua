local M = {}

function M.setup()
  require('sniprun').setup({
    display = {
      'Classic',
      'VirtualTextOk',
      'TempFloatingWindow',
      'NvimNotify',
    },
  })
end

function M.keymaps()
  return {
    { '<space>sr', ':SnipRun<CR>', desc = 'Trigger [S]nip [R]un (run code runner)', mode = { 'n', 'x' } },
    { '<space>sc', vim.cmd.SnipClose, desc = '[S]nip [C]lose (close code runner)' },
  }
end

return M
