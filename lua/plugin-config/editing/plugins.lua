local base_dir = 'plugin-config.editing.'

local function config_path(plugin_name)
  return base_dir .. plugin_name
end

return {
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    config = function()
      require(config_path('comment')).setup()
    end,
  },

  {
    'stevearc/conform.nvim',
    lazy = true,
    event = 'BufWritePre',
    config = function()
      require(config_path('conform')).setup()
    end,
  },

  {
    'chrisgrieser/nvim-puppeteer',
    event = 'VeryLazy',
    dependencies = 'nvim-treesitter/nvim-treesitter',
  },

  {
    'danymat/neogen',
    lazy = true,
    config = function()
      require(config_path('neogen')).setup()
    end,
  },

  {
    'altermo/ultimate-autopair.nvim',
    event = 'InsertEnter',
    dependencies = {
      'RRethy/nvim-treesitter-endwise',
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
    lazy = true,
    config = function()
      require(config_path('treesj')).setup()
    end,
  },

  {
    'AckslD/muren.nvim',
    keys = require(config_path('muren')).keymaps(),
    config = function()
      require(config_path('muren')).setup()
    end,
  },

  {
    'cshuaimin/ssr.nvim',
    lazy = true,
    config = function()
      require(config_path('ssr')).setup()
    end,
  },

  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function()
      require(config_path('nvim-surround')).setup()
    end,
  },
}
