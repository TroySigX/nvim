local M = {}

function M.keymaps()
  require('which-key').register({
    ['<A-d>'] = {
      function()
        require('notify').dismiss()
      end,
      'Notification [D]ismiss',
    },

    ['<A-n>'] = {
      function()
        require('telescope').extensions.notify.notify()
      end,
      'Notification History',
    },
  }, { mode = { 'n', 'i', 'v' } })
end

function M.setup()
  require('telescope').load_extension('notify')
  vim.notify = require('notify')
  vim.notify.setup({
    timeout = 1500,
  })
end

return M
