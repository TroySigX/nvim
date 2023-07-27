local M = {}

function M.setup()
  local path = require('lspconfig.util').path
  vim.g.db_ui_save_location = path.join(vim.fn.stdpath('data'), 'db_ui')
end

function M.keymaps()
  return {
    { '<space>du', vim.cmd.DBUIToggle, silent = true, desc = 'Dadbod UI (database)' },
    { '<space>df', vim.cmd.DBUIFindBuffer, silent = true, desc = 'Find Database buffer' },
    { '<space>dr', vim.cmd.DBUIRenameBuffer, silent = true, desc = 'Rename Database buffer' },
    { '<space>dq', vim.cmd.DBUILastQueryInfo, silent = true, desc = 'Last Database query info' },
  }
end

return M
