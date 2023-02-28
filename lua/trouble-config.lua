require('trouble').setup {}

local map = vim.keymap.set

map({'n', 'i', 'v' }, '<F1>', '<Esc>:TroubleToggle<CR>', { desc = 'Toggle Trouble List', silent = true })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show [E]rrors on line' })
map('n', '<C-k>', vim.diagnostic.goto_prev, { desc = 'Go To Previous Error' })
map('n', '<C-j>', vim.diagnostic.goto_next, { desc = 'Go To Next Error' })
