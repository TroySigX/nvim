local M = {}

function M.setup()
  require('todo-comments').setup({
    search = {
      args = {
        '--no-ignore',
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
    '<Esc>:TodoTelescope keywords=TODO,FIX<CR>',
    'Open TODO List',
    mode = { 'n', 'i', 'x' },
  })
end

return M
