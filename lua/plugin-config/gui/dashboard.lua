local M = {}

function M.setup()
  require('dashboard').setup({
    theme = 'hyper',
    hide = {
      tabline = false,
    },
    config = {
      header = {
        '████████╗██████╗  ██████╗ ██╗   ██╗███████╗██╗ ██████╗ ██╗  ██╗',
        '╚══██╔══╝██╔══██╗██╔═══██╗╚██╗ ██╔╝██╔════╝██║██╔════╝ ╚██╗██╔╝',
        '   ██║   ██████╔╝██║   ██║ ╚████╔╝ ███████╗██║██║  ███╗ ╚███╔╝ ',
        '   ██║   ██╔══██╗██║   ██║  ╚██╔╝  ╚════██║██║██║   ██║ ██╔██╗ ',
        '   ██║   ██║  ██║╚██████╔╝   ██║   ███████║██║╚██████╔╝██╔╝ ██╗',
        '   ╚═╝   ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝',
      },
      packages = { enable = true },
      project = {
        limit = 5,
        icon = '󰏓 ',
        label = 'Recent Projects:',
        action = function(path)
          require('fzf-lua').files({ cwd = path })
        end,
      },
      mru = {
        limit = 10,
        icon = ' ',
        label = 'Recent Files:',
      },
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = require('lazy').update, key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = function()
            require('fzf-lua').files()
          end,
          key = 'f',
        },
        { desc = ' Mason', group = '@property', action = 'Mason', key = 'm' },
        { desc = ' Profile', action = require('lazy').profile, key = 'p' },
        { desc = '󰗼 Quit', action = 'q', key = 'q' },
      },
      footer = { '', '🚀 Think twice, Code once' },
    },
  })
end

return M
