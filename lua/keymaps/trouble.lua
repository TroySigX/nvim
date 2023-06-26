require('which-key').register({
  ['<F1>'] = { '<Esc>:TroubleToggle<CR>', 'Toggle Trouble List' }
}, { mode = { 'n', 'i', 'v' } })
