require('which-key').register({
  ['<C-s>'] = { ':MurenOpen<CR>', '[S]ubstitute' },
}, { mode = { 'n', 'v' } })
