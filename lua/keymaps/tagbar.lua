require('which-key').register({
  ['<F5>'] = { '<Esc>:TagbarToggle<CR>', 'Toggle Tagbar' }
}, { mode = { 'n', 'i', 'v' } })
