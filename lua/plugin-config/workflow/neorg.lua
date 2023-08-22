local M = {}

function M.setup()
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
          -- TODO: look for more cross-platform way
          workspaces = {
            proj = '~/notes/projects',
            umass = '~/notes/umass',
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
