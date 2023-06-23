require('muren').setup()

local map = vim.keymap.set
map({ 'n', 'v' }, '<C-s>', ':MurenOpen<CR>', { desc = '[S]ubstitute', silent = true })
