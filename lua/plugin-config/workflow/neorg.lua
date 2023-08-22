local M = {}

function M.setup()
  local path = require('lspconfig.util').path
  local base_path = path.join(vim.fn.expand('$HOME'), 'notes')

  require('neorg').setup({
    load = {
      ['core.defaults'] = {}, -- Loads default behaviour
      ['core.concealer'] = {}, -- Adds pretty icons to your documents
      ['core.completion'] = {
        config = {
          engine = 'nvim-cmp',
        },
      },
      ['core.dirman'] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            proj = path.join(base_path, 'projects'),
            umass = path.join(base_path, 'umass'),
          },
        },
      },
    },
  })
end

function M.keymaps()
  return {
    { '<space>now', ':Neorg workspace', desc = '[N]e[O]rg [W]orkspace' },
    { '<space>noi', ':Neorg index<CR>', silent = true, desc = '[N]e[O]rg [I]ndex' },
  }
end

return M
