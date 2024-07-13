local M = {}

function M.setup()
  require('trouble').setup({
    focus = true,
  })
end

function M.keymaps()
  require('utils.keymaps').add_keymap({
    '<F1>',
    function()
      require('trouble').toggle('diagnostics')
    end,
    'Toggle Trouble (diagnostic) List',
    mode = { 'n', 'i', 'x' },
  })
end

return M
