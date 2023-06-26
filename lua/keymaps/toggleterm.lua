require('which-key').register({
  ['<F9>'] = { '<Esc>:ToggleTerm<CR>', 'Toggle Term' }
}, { mode = { 'n', 'i', 'v' } })

require('which-key').register({
  ['<F9>'] = { '<C-\\><C-N>:ToggleTerm<CR>', 'Toggle Term' }
}, { mode = 't' })
