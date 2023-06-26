require('which-key').register({
  ['<space>h'] = { function() require('noice').cmd('viewLast') end, 'Noice view last' }
})
