local function after_plugin_settings()
  require('settings.after-plugin')
end

require('settings.before-plugin')
vim.schedule(after_plugin_settings)
