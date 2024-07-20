local config_path = require('utils.path').config_dir('navigation')
local conf = require(config_path())

return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    init = function()
      conf.register_plugin_name('flash-nvim')
    end,
    config = function()
      require(config_path('flash-nvim')).setup()
    end,
  },

  {
    'stevearc/aerial.nvim',
    lazy = true,
    init = function()
      conf.register_plugin_name('aerial')
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require(config_path('aerial')).setup()
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = 'VeryLazy',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'folke/which-key.nvim',
    },
    config = function()
      require(config_path('treesitter-textobjects')).setup()
    end,
  },

  {
    'karb94/neoscroll.nvim',
    keys = require(config_path('neoscroll')).keymaps({ 'desc', 'mode' }),
    config = function()
      require(config_path('neoscroll')).setup()
    end,
  },
}
