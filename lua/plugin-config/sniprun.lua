require('sniprun').setup({
  display = {
    'Classic',
    'VirtualTextOk',
    'TempFloatingWindow',
    'NvimNotify',
  }
})

local map = vim.keymap.set
map({ 'n', 'v' }, '<space>sr', ':SnipRun<CR>', { desc = 'Trigger [S]nip [R]un', silent = true })
map('n', '<space>sc', ':SnipClose<CR>', { desc = '[S]nip [C]lose', silent = true })
