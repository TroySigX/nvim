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
  return {
    { '<space>sr', vim.cmd.SnipRun, desc = 'Trigger [S]nip [R]un' },
    { '<space>sc', vim.cmd.SnipClose, desc = '[S]nip [C]lose' },
  }
end

return M
