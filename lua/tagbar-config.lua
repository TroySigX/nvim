vim.g.tagbar_autofocus = 1
local map = vim.keymap.set

map({ 'n', 'i', 'v' }, '<F5>', '<ESC>:TagbarToggle<CR>', { desc = 'Toggle Tagbar', silent = true })
