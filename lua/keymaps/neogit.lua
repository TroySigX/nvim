require('which-key').register({
  ['<F10>'] = { require('neogit').open, 'Open Neogit' },
}, { mode = { 'n', 'v', 'i' } })
