local M = {}

function M.keymaps()
  require('which-key').register({
    ['<space>sl'] = {
      function()
        require('persistence').load()
      end,
      'Load last session',
    },
  })
end

return M
