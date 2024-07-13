local M = {}

function M.setup()
  require('smart-splits').setup()
end

function M.keymaps()
  local map = require('utils.keymaps').add_keymap
  map({
    '<C-Left>',
    function()
      require('smart-splits').resize_left()
    end,
    'Resize buffer left',
    mode = { 'n', 'x' },
  })
  map({
    '<C-Right>',
    function()
      require('smart-splits').resize_right()
    end,
    'Resize buffer right',
    mode = { 'n', 'x' },
  })
  map({
    '<C-Up>',
    function()
      require('smart-splits').resize_up()
    end,
    'Resize buffer up',
    mode = { 'n', 'x' },
  })
  map({
    '<C-Down>',
    function()
      require('smart-splits').resize_down()
    end,
    'Resize buffer down',
    mode = { 'n', 'x' },
  })

  -- moving buffers
  map({
    '<C-S-h>',
    function()
      require('smart-splits').swap_buf_left({ move_cursor = true })
    end,
    'move buffer left',
    mode = { 'n', 'x' },
  })
  map({
    '<C-S-l>',
    function()
      require('smart-splits').swap_buf_right({ move_cursor = true })
    end,
    'move buffer right',
    mode = { 'n', 'x' },
  })
  map({
    '<C-S-j>',
    function()
      require('smart-splits').swap_buf_down({ move_cursor = true })
    end,
    'move buffer down',
    mode = { 'n', 'x' },
  })
  map({
    '<C-S-k>',
    function()
      require('smart-splits').swap_buf_up({ move_cursor = true })
    end,
    'move buffer up',
    mode = { 'n', 'x' },
  })
end

return M
