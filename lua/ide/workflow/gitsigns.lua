local M = {}

function M.setup()
  require('gitsigns').setup()
end

function M.keymaps()
  local map = require('utils.keymaps').add_keymap

  map({
    '<leader>gbl',
    function()
      require('gitsigns').blame_line()
    end,
    '[G]it [B]lame [L]ine',
  })
end

return M
