local map = vim.keymap.set

map({ 'n', 'v' }, 'g', '<Plug>(leap-forward-to)', { desc = '[g]oto word forward (leap nvim)' })
map({ 'n', 'v' }, 'G', '<Plug>(leap-backward-to)', { desc = '[G]oto word backward (leap nvim)' })
