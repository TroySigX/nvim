local M = {}

function M.keymaps()
  local map = require('utils.keymaps').add_keymap
  map({
    '<A-d>',
    function()
      require('notify').dismiss()
    end,
    'Notification [D]ismiss',
    mode = { 'n', 'i', 'x' },
  })

  map({
    '<A-n>',
    function()
      require('telescope').extensions.notify.notify()
    end,
    'Notification History',
    mode = { 'n', 'i', 'x' },
  })
end

function M.setup()
  require('telescope').load_extension('notify')
  vim.notify = require('notify')
  vim.notify.setup({
    timeout = 1500,
  })
end

return M
