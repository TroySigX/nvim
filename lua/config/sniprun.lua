require('sniprun').setup({
  display = {
    'Classic',
    'VirtualTextOk',
    'TempFloatingWindow'
  }
})

local map = vim.keymap.set
map({ 'n', 'v' }, '<space>sr', ':SnipRun', { desc = 'Trigger [S]nip [R]un' })