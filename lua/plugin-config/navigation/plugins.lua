local base_dir = 'plugin-config.navigation.'

local function config_path(plugin_name)
  return base_dir .. plugin_name
end

return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    config = function()
      require(config_path('flash-nvim')).setup()
    end,
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
}
