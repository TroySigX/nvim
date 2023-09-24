local M = {}

function M.keymaps()
  return {
    {
      '<F7>',
      function()
        require('telescope').extensions.undo.undo()
      end,
      desc = 'Toggle UndoTree',
      mode = { 'n', 'i', 'v' },
    },
  }
end

function M.setup()
  require('telescope').load_extension('undo')
end

return M
