local M = {}

function M.keymaps()
  return {
    {
      '<F7>',
      function()
        require('telescope').extensions.undo.undo()
      end,
      desc = 'Open UndoTree',
      mode = { 'n', 'i', 'x' },
    },
  }
end

function M.setup()
  require('telescope').setup({
    extensions = {
      undo = {
        mappings = {
          i = {
            ['<cr>'] = require('telescope-undo.actions').restore,
          },
        },
      },
    },
  })
end

return M
