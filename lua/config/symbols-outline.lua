require("symbols-outline").setup()

local map = vim.keymap.set
map({ 'n', 'i', 'v' }, '<F11>', '<ESC>:SymbolsOutline<CR>', { desc = 'Toggle Tagbar', silent = true })