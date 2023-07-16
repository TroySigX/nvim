local others_config_path = 'plugin-config.others.'

return {
  {
    'tyru/open-browser.vim',
    keys = require(others_config_path .. 'open-browser').keymaps(),
  },

  {
    'tpope/vim-dadbod',
    keys = require(others_config_path .. 'dadbod').keymaps(),
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
    },
    config = function()
      require(others_config_path .. 'dadbod').setup()
    end,
  },

  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    keys = require(others_config_path .. 'competitest').keymaps(),
    config = function()
      require(others_config_path .. 'competitest').setup()
    end,
  },

  {
    'glacambre/firenvim',

    cond = not not vim.g.started_by_firenvim,
    build = function()
      require('lazy').load({ plugins = 'firenvim', wait = true })
      vim.fn['firenvim#install'](0)
    end,
    config = function()
      require(others_config_path .. 'firenvim').setup()
    end,
  },
}
