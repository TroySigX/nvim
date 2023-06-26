local M = {}

function M.setup()
  vim.g.db_ui_save_location = vim.fn.stdpath 'config' .. require('plenary.path').path.sep .. 'db_ui'
end

function M.keymaps()
  require('which-key').register({
    u = { '<cmd>DBUIToggle<CR>', 'Dadbod UI' },
    f = { '<cmd>DBUIFindBuffer<CR>', 'Find DB buffer' },
    r = { '<cmd>DBUIRenameBuffer<CR>', 'Rename DB buffer' },
    q = { '<cmd>DBUILastQueryInfo<CR>', 'Last DB query info' },
  }, { prefix = '<space>d' })
end

return M
