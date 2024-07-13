local M = {}

function M.keymaps()
  require('utils.keymaps').add_keymap({
    '<space>ts',
    function()
      require('ts-node-action').node_action()
    end,
    'TS Node Action (toggle boolean, if/else <-> ternary, toggle operator)',
  })
end

return M
