local map = vim.keymap.set

map({ 'n', 'v' }, 't', '<Plug>(leap-forward-to)', { desc = '[T]o word forward (leap nvim)' })
map({ 'n', 'v' }, 'T', '<Plug>(leap-backward-to)', { desc = '[T]o word backward (leap nvim)' })
