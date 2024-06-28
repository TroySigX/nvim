local M = {}

function M.keymaps()
  require('which-key').register({
    ['<F7>'] = {
      function()
        require('persistence').load()
      end,
      'Load last session',
    },
  }, { mode = { 'n', 'i', 'x' } })
end

return M
