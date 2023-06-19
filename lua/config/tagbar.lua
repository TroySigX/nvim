vim.g.tagbar_autofocus = 1
vim.g.tagbar_sort = 0
vim.g.tagbar_show_balloon = 0
vim.g.tagbar_show_linenumbers = 1
vim.g.tagbar_silent = 1
vim.g.tagbar_autopreview = 1
vim.g.tagbar_previewwin_pos = 'aboveleft'

local map = vim.keymap.set
map({ 'n', 'i', 'v' }, '<F5>', '<ESC>:TagbarToggle<CR>', { desc = 'Toggle Tagbar', silent = true })
