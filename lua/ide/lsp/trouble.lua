local M = {}

function M.setup()
  require('trouble').setup({
    focus = true,
    warn_no_results = false,
    open_no_results = true,
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
