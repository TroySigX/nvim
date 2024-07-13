local M = {}

function M.keymaps()
  require('utils.keymaps').add_keymap({
    '<F7>',
    function()
      require('persistence').load()
    end,
    'Load last session',
    mode = { 'n', 'i', 'x' },
  })
end

return M
