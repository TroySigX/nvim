vim.g.db_ui_save_location = vim.fn.stdpath 'config' .. require('plenary.path').path.sep .. 'db_ui'

local map = vim.keymap.set
map('n', 'Du', '<cmd>DBUIToggle<CR>', { desc = 'Toggle UI' })
map('n', 'Df', '<cmd>DBUIFindBuffer<CR>', { desc = 'Find buffer' })
map('n', 'Dr', '<cmd>DBUIRenameBuffer<CR>', { desc = 'Rename buffer' })
map('n', 'Dq', '<cmd>DBUILastQueryInfo<CR>', { desc = 'Last query info' })
