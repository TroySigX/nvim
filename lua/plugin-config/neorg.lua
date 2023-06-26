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
