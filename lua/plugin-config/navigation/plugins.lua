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
    'stevearc/aerial.nvim',
    lazy = true,
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
