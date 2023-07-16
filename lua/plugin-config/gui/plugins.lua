local gui_config_path = 'plugin-config.gui.'

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
      require(gui_config_path .. 'notify').setup()
      require(gui_config_path .. 'noice').setup()
      require(gui_config_path .. 'lualine').setup()
    end,
  },

  {
    'nvimdev/dashboard-nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require(gui_config_path .. 'dashboard').setup()
    end,
  },

  {
    'folke/tokyonight.nvim',
    config = function()
      require(gui_config_path .. 'colorscheme').setup()
    end,
  },

  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require(gui_config_path .. 'bufferline').setup()
    end,
  },

  {
    'stevearc/dressing.nvim',
    config = function()
      require(gui_config_path .. 'dressing').setup()
    end,
  },
}
