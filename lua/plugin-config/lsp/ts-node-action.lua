local M = {}

function M.keymaps()
  require('which-key').register({
    ts = {
      function()
        require('ts-node-action').node_action()
      end,
      'Treesitter Node Action',
    }
  }, { prefix = '<space>' })
end

return M
