local M = {}

function M.keymaps()
  require('which-key').register({
    ['<leader>nd'] = {
      function()
        require('notify').dismiss()
      end,
      '[N]otification [D]ismiss',
    },
  })
end

function M.setup()
  vim.notify = require('notify')
  vim.notify.setup({
    timeout = 1500,
  })
end

return M
