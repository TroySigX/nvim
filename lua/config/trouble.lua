require('trouble').setup {}

local map = vim.keymap.set
map({'n', 'i', 'v' }, '<F1>', '<Esc>:TroubleToggle<CR>', { desc = 'Toggle Trouble List', silent = true })
