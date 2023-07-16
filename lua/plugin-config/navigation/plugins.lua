local navigation_config_path = 'plugin-config.navigation.'

return {
  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
  },

  {
    'preservim/tagbar',
    keys = require(navigation_config_path .. 'tagbar').keymaps(),
    config = function()
      require('plugin-config.navigation.tagbar').setup()
    end,
  },

  {
    'karb94/neoscroll.nvim',
    keys = require(navigation_config_path .. 'neoscroll').keymaps({ 'desc', 'mode' }),
    config = function()
      require(navigation_config_path .. 'neoscroll').setup()
    end,
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
      'nvim-treesitter/nvim-treesitter',
      'luukvbaal/statuscol.nvim',
    },
    config = function()
      require(navigation_config_path .. 'nvim-ufo').setup()
    end,
  },
}
