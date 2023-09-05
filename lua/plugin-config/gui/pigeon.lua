local M = {}

function M.setup()
  require('pigeon').setup({
    os = 'linux', -- TODO: Detect this
    plugin_manager = 'lazy',
    callbacks = {
      killing_pigeon = nil,
      respawning_pigeon = nil,
    },
    datetime = {
      time = {
        format = '%H:%M %p',
        posttext = '',
        icon = '󰃰 ',
      },
    },
  })
end

return M
