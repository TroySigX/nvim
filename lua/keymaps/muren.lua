require('which-key').register({
  ['<C-s>'] = { function() require('muren.api').toggle_ui({}) end, 'Toggle [S]ubstitute' },
}, { mode = { 'n', 'v' } })
