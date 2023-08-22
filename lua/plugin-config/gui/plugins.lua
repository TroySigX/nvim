local base_dir = 'plugin-config.gui.'

local function config_path(plugin_name)
  return base_dir .. plugin_name
end

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'rcarriga/nvim-notify',
      {
        'folke/noice.nvim',
        dependencies = 'MunifTanjim/nui.nvim',
      },
    },
    config = function()
      require(config_path('notify')).setup()
      require(config_path('noice')).setup()
      require(config_path('lualine')).setup()
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
}
