local M = {}

function M.setup()
  vim.notify = require('notify')
  vim.notify.setup({
    timeout = 1500,
  })
end

return M
