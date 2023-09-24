local M = {}

function M.setup()
  local actions = require('telescope.actions')
  require('telescope').setup({
    defaults = {
      mappings = {
        i = {
          ['<C-j>'] = {
            actions.move_selection_next,
            type = 'action',
            opts = { nowait = true, silent = true },
          },

          ['<C-k>'] = {
            actions.move_selection_previous,
            type = 'action',
            opts = { nowait = true, silent = true },
          },
        },
      },
    },
  })
end

return M
