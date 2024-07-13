local M = {}

function M.setup()
  require('todo-comments').setup()
end

function M.keymaps()
  require('utils.keymaps').add_keymap({
    '<F3>',
    vim.cmd.TodoTelescope,
    'Open TODO List',
    mode = { 'n', 'i', 'x' },
  })
end

return M
