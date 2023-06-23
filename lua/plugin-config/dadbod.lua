vim.g.db_ui_save_location = vim.fn.stdpath 'config' .. require('plenary.path').path.sep .. 'db_ui'

local map = vim.keymap.set
map('n', '<space>du', '<cmd>DBUIToggle<CR>', { desc = 'Toggle UI' })
map('n', '<space>df', '<cmd>DBUIFindBuffer<CR>', { desc = 'Find buffer' })
map('n', '<space>dr', '<cmd>DBUIRenameBuffer<CR>', { desc = 'Rename buffer' })
map('n', '<space>dq', '<cmd>DBUILastQueryInfo<CR>', { desc = 'Last query info' })
