require('which-key').register({
  ['<A-H>'] = { require('smart-splits').resize_left, 'Resize buffer left' },
  ['<A-J>'] = { require('smart-splits').resize_down, 'Resize buffer down' },
  ['<A-K>'] = { require('smart-splits').resize_up, 'Resize buffer up' },
  ['<A-L>'] = { require('smart-splits').resize_right, 'Resize buffer right' },

  ['<leader><leader>'] = {
    h = { function() require('smart-splits').swap_buf_left({ move_cursor = true }) end, 'move buffer left' },
    j = { function() require('smart-splits').swap_buf_down({ move_cursor = true }) end, 'move buffer down' },
    k = { function() require('smart-splits').swap_buf_up({ move_cursor = true }) end, 'move buffer up' },
    l = { function() require('smart-splits').swap_buf_right({ move_cursor = true }) end, 'move buffer right' },
  }
})
