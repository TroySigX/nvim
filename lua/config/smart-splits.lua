require('smart-splits').setup({})

local map = vim.keymap.set
map('n', '<A-h>', require('smart-splits').resize_left, { desc = 'Resize buffer left' })
map('n', '<A-j>', require('smart-splits').resize_down, { desc = 'Resize buffer down' })
map('n', '<A-k>', require('smart-splits').resize_up, { desc = 'Resize buffer up' })
map('n', '<A-l>', require('smart-splits').resize_right, { desc = 'Resize buffer right' })

map('n', '<leader><leader>h', function() require('smart-splits').swap_buf_left({ move_cursor = true }) end, { desc = 'move buffer left' })
map('n', '<leader><leader>j', function() require('smart-splits').swap_buf_down({ move_cursor = true }) end, { desc = 'move buffer down' })
map('n', '<leader><leader>k', function() require('smart-splits').swap_buf_up({ move_cursor = true }) end, { desc = 'move buffer up' })
map('n', '<leader><leader>l', function() require('smart-splits').swap_buf_right({ move_cursor = true }) end, { desc = 'move buffer right' })
