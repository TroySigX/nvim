local M = {}

function M.keymaps()
  require('which-key').register({
    ['<A-d>'] = {
      function()
        require('notify').dismiss()
      end,
      '[N]otification [D]ismiss',
    },
  }, { mode = { 'n', 'i', 'v' } })
end

function M.setup()
  vim.notify = require('notify')
  vim.notify.setup({
    timeout = 1500,
  })
end

return M
