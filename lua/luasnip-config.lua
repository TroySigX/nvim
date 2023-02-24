require('luasnip.loaders.from_snipmate').lazy_load({ paths = { '~/.config/nvim/snippets' } })

local map = vim.keymap.set
map('i', '<C-j>', function() require'luasnip'.jump(1) end, { desc = 'Go to next placeholder in snippet' })
map('s', '<C-j>', function() require'luasnip'.jump(1) end, { desc = 'Go to next placeholder in snippet' })
map('i', '<C-k>', function() require'luasnip'.jump(-1) end, { desc = 'Go to previous placeholder in snippet' })
map('s', '<C-k>', function() require'luasnip'.jump(-1) end, { desc = 'Go to previous placeholder in snippet' })
