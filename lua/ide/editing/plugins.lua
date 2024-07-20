local config_path = require('utils.path').config_dir('editing')
local conf = require(config_path())

return {
  {
    'chrisgrieser/nvim-puppeteer',
    dependencies = 'nvim-treesitter/nvim-treesitter',
  },

  {
    'danymat/neogen',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    lazy = true,
    init = function()
      conf.register_plugin_name('neogen')
    end,
    config = function()
      require(config_path('neogen')).setup()
    end,
  },

  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      {
        'RRethy/nvim-treesitter-endwise',
        dependencies = 'nvim-treesitter/nvim-treesitter',
      },
      'windwp/nvim-ts-autotag',
    },
    config = function()
      require(config_path('autopairs')).setup()
    end,
  },

  {
    'echasnovski/mini.move',
    keys = require(config_path('mini-move')).keymaps(),
    config = function()
      require(config_path('mini-move')).setup()
    end,
  },

  {
    'Wansmer/treesj',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    lazy = true,
    init = function()
      conf.register_plugin_name('treesj')
    end,
    config = function()
      require(config_path('treesj')).setup()
    end,
  },

  {
    'kylechui/nvim-surround',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    config = function()
      require(config_path('nvim-surround')).setup()
    end,
  },
}
