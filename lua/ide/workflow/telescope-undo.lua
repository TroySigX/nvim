local M = {}

function M.keymaps()
  require('which-key').register({
    ['<space>ut'] = {
      function()
        require('telescope').extensions.undo.undo()
      end,
      'Open [U]ndo[T]ree',
    },
  })
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
