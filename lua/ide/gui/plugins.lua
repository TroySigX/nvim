local config_path = require('utils.path').config_dir('gui')
local conf = require(config_path())

return {
  {
    'folke/noice.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
      require(config_path('noice')).setup()
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'folke/noice.nvim',
    },
    config = function()
      require(config_path('lualine')).setup()
    end,
  },

  {
    'rcarriga/nvim-notify',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    priority = 200,
    init = function()
      conf.register_keymap('notify')
    end,
    config = function()
      require(config_path('notify')).setup()
    end,
  },

  {
    'nvimdev/dashboard-nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require(config_path('dashboard')).setup()
    end,
  },

  {
    'folke/tokyonight.nvim',
    priority = 200,
    config = function()
      require(config_path('colorscheme')).setup()
    end,
  },

  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require(config_path('bufferline')).setup()
    end,
  },

  {
    'NvChad/nvim-colorizer.lua',
    lazy = true,
    init = function()
      conf.register_keymap('nvim-colorizer')
    end,
    config = function()
      require(config_path('nvim-colorizer')).setup()
    end,
  },

  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    config = function()
      require(config_path('dressing')).setup()
    end,
  },

  {
    'mrjones2014/smart-splits.nvim',
    lazy = true,
    init = function()
      conf.register_keymap('smart-splits')
    end,
    config = function()
      require(config_path('smart-splits')).setup()
    end,
  },

  {
    'HiPhish/rainbow-delimiters.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require(config_path('rainbow-delimiters')).setup()
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    dependencies = {
      'HiPhish/rainbow-delimiters.nvim',
    },
    event = 'VeryLazy',
    config = function()
      require(config_path('indent-blankline')).setup()
    end,
  },

  {
    'tzachar/highlight-undo.nvim',
    keys = { 'u', '<C-r>' },
    config = function()
      require(config_path('highlight-undo')).setup()
    end,
  },

  {
    'kevinhwang91/nvim-ufo',
    event = 'VeryLazy',
    dependencies = {
      'kevinhwang91/promise-async',
      'luukvbaal/statuscol.nvim',
    },
    config = function()
      require(config_path('nvim-ufo')).setup()
    end,
  },
}
