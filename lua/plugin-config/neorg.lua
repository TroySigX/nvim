local M = {}

function M.setup()
  require('neorg').setup {
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
          proj = '/mnt/HDD/notes/projects',
          umass = '/mnt/HDD/notes/umass',
        },
        open_last_workspace = true,
      },
    },
  },
}
end

function M.keymaps()
  require('which-key').register({
    ['<space>now'] = { ':Neorg workspace', '[N]e[O]rg [W]orkspace' }
  }, { silent = false })

  require('which-key').register({
    ['<space>noi'] = { ':Neorg index<CR>', '[N]e[O]rg [I]ndex' }
  })
end

return M
