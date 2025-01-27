local M = {}

function M.setup()
  require('todo-comments').setup({
    search = {
      args = {
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
      },
    },
  })
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
