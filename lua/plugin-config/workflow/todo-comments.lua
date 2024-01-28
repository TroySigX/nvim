local M = {}

function M.setup()
  require('todo-comments').setup()
end

function M.keymaps()
  require('which-key').register({
    ['<F3>'] = {
      vim.cmd.TodoTelescope,
      'Open TODO List',
    },
  }, { mode = { 'n', 'i', 'x' } })
end

return M
