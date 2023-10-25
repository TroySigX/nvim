local base_dir = 'plugin-config.gui.'

local function config_path(plugin_name)
  return base_dir .. plugin_name
end

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'Pheon-Dev/pigeon',
      {
        'folke/noice.nvim',
        dependencies = 'MunifTanjim/nui.nvim',
      },
    },
    config = function()
      require(config_path('noice')).setup()
      -- pigeon has to init before lualine
      require(config_path('pigeon')).setup()
      require(config_path('lualine')).setup()
    end,
  },

  {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    dependencies = 'nvim-telescope/telescope.nvim',
    priority = 100,
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
    priority = 100,
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
    keys = require(config_path('nvim-colorizer')).keymaps(),
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
    config = function()
      require(config_path('smart-splits')).setup()
    end,
  },

  {
    'kevinhwang91/nvim-bqf',
    event = 'VeryLazy',
    config = function()
      require(config_path('nvim-bqf')).setup()
    end,
  },

  {
    'HiPhish/rainbow-delimiters.nvim',
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
    'lukas-reineke/headlines.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    ft = 'markdown',
    config = function()
      require(config_path('headlines')).setup()
    end,
  },

  {
    'kevinhwang91/nvim-ufo',
    event = 'VeryLazy',
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
