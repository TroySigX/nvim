local M = {}

local OSes = {
  Linux = 'linux',
  Darwin = 'osx',
  Windows_NT = 'windows',
}

function M.setup()
  require('pigeon').setup({
    os = OSes[vim.loop.os_uname().sysname],
    plugin_manager = 'lazy',
    callbacks = {
      killing_pigeon = nil,
      respawning_pigeon = nil,
    },
    datetime = {
      time = {
        format = '%I:%M %p',
        posttext = '',
        icon = '󰃰 ',
      },
    },
  })
end

return M
