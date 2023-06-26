require('which-key').register({
  ['<C-j>'] = { function() require('luasnip').jump(1) end, 'Go to next placeholder in snippet' },
  ['<C-k>'] = { function() require('luasnip').jump(-1) end, 'Go to previous placeholder in snippet' },
}, { mode = { 'i', 's' } })
