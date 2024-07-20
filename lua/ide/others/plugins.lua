local config_path = require('utils.path').config_dir('others')
local conf = require(config_path())

return {
  {
    'xeluxee/competitest.nvim',
    cmd = 'CompetiTest',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    init = function()
      conf.register_plugin_name('competitest')
    end,
    config = function()
      require(config_path('competitest')).setup()
    end,
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require(config_path('which-key')).setup()
    end,
  },

  {
    'glacambre/firenvim',

    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn['firenvim#install'](0)
    end,
    config = function()
      require(config_path('firenvim')).setup()
    end,
  },
}
