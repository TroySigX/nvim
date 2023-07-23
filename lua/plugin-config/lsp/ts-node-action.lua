local M = {}

function M.keymaps()
  require('which-key').register({
    ts = {
      function()
        require('ts-node-action').node_action()
      end,
      'TS Node Action (toggle boolean, if/else <-> ternary, toggle operator)',
    },
  }, { prefix = '<space>' })
end

return M
