local map = vim.keymap.set
map({ 'n', 'i', 'v' }, '<F6>', require('fzf-lua').files, { desc = 'Find files' })

map({ 'n', 'i', 'v' }, '<F18>', require('fzf-lua').oldfiles, { desc = 'Old files' })

map('n', '<space>gr', require('fzf-lua').live_grep, { desc = 'Live [Gr]ep' })
map('n', '<space>sw', require('fzf-lua').grep_cword, { desc = '[S]earch [W]ord' })
map('n', '<space>km', require('fzf-lua').keymaps, { desc = '[K]ey[M]aps' })

require('fzf-lua').setup()
