local base_dir = 'plugin-config.navigation.'

local function config_path(plugin_name)
  return base_dir .. plugin_name
end

return {
  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
  },

  {
    'preservim/tagbar',
    keys = require(config_path('tagbar')).keymaps(),
    config = function()
      require(config_path('tagbar')).setup()
    end,
  },

  {
    'karb94/neoscroll.nvim',
    keys = require(config_path('neoscroll')).keymaps({ 'desc', 'mode' }),
    config = function()
      require(config_path('neoscroll')).setup()
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
      require(config_path('nvim-ufo')).setup()
    end,
  },
}
