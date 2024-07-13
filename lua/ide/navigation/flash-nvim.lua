local M = {}

function M.keymaps()
  local map = require('utils.keymaps').add_keymap
  map({
    't',
    function()
      require('flash').jump({
        jump = {
          autojump = true,
        },
      })
    end,
    'go [t]o word forward (word after cursor)',
    mode = { 'n', 'x' },
  })
  map({
    'T',
    function()
      require('flash').jump({
        search = { forward = false, wrap = false, multi_window = false },
        jump = {
          autojump = true,
        },
      })
    end,
    'go [T]o word backward (word before cursor)',
    mode = { 'n', 'x' },
  })
end

function M.setup()
  require('flash').setup({
    modes = {
      search = {
        enabled = true,
      },
      char = {
        enabled = false,
      },
    },
  })
end

return M
