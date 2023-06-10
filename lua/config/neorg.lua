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

local map = vim.keymap.set
map('n', '<space>now', ':Neorg workspace ', { desc = '[N]e[O]rg [W]orkspace' })
map('n', '<space>noi', ':Neorg index<CR> ', { desc = '[N]e[O]rg [W]orkspace', noremap = true, silent = true })
