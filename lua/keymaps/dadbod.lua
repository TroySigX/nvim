require('which-key').register({
  u = { '<cmd>DBUIToggle<CR>', 'Dadbod UI' },
  f = { '<cmd>DBUIFindBuffer<CR>', 'Find DB buffer' },
  r = { '<cmd>DBUIRenameBuffer<CR>', 'Rename DB buffer' },
  q = { '<cmd>DBUILastQueryInfo<CR>', 'Last DB query info' },
}, { prefix = '<space>d' })
