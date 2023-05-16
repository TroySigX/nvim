require('symbols-outline').setup({
  auto_preview = true,
})

local map = vim.keymap.set
map({ 'n', 'i', 'v' }, '<F5>', '<ESC>:SymbolsOutline<CR>', { desc = 'Toggle Tagbar', silent = true })
