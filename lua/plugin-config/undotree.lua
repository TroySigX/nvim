local M = {}

function M.keymaps()
  require('which-key').register({
    ['<F7>'] = { vim.cmd.UndotreeToggle, 'Toggle UndoTree' }
  })
end

return M
