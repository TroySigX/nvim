local base_dir = 'plugin-config.others.'

local function config_path(plugin_name)
  return base_dir .. plugin_name
end

return {
  {
    'sontungexpt/url-open',
    keys = require(config_path('url-open')).keymaps(),
    config = function()
      require(config_path('url-open')).setup()
    end,
  },

  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    keys = require(config_path('competitest')).keymaps(),
    config = function()
      require(config_path('competitest')).setup()
    end,
  },

  {
    'glacambre/firenvim',

    cond = not not vim.g.started_by_firenvim,
    build = function()
      require('lazy').load({ plugins = 'firenvim', wait = true })
      vim.fn['firenvim#install'](0)
    end,
    config = function()
      require(config_path('firenvim')).setup()
    end,
  },
}
