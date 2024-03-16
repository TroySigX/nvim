local M = {}

function M.keymaps()
  return {
    { '<A-h>', mode = { 'n', 'x' }, desc = 'move text to the left' },
    { '<A-j>', mode = { 'n', 'x' }, desc = 'move text down 1 line' },
    { '<A-k>', mode = { 'n', 'x' }, desc = 'move text up 1 line' },
    { '<A-l>', mode = { 'n', 'x' }, desc = 'move text to the right' },
  }
end

function M.setup()
  require('mini.move').setup({
    mappings = {
      left = '<A-h>',
      right = '<A-l>',
      down = '<A-j>',
      up = '<A-k>',

      line_left = '<A-h>',
      line_right = '<A-l>',
      line_down = '<A-j>',
      line_up = '<A-k>',
    },
  })
end

return M
