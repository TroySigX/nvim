local config_path = require('utils.path').config_dir('workflow')
local conf = require(config_path())

return {
  {
    'akinsho/toggleterm.nvim',
    cmd = 'ToggleTermSetName',
    init = function()
      conf.register_plugin_name('toggleterm')
    end,
    config = function()
      require(config_path('toggleterm')).setup()
    end,
  },

  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = 'VeryLazy',
    init = function()
      conf.register_plugin_name('todo-comments')
    end,
    config = function()
      require(config_path('todo-comments')).setup()
    end,
  },

  {
    'frabjous/knap',
    lazy = true,
    init = function()
      conf.register_plugin_name('knap')
    end,
    config = function()
      require(config_path('knap')).setup()
    end,
  },

  {
    'NeogitOrg/neogit',
    dependencies = {
      'sindrets/diffview.nvim',
      'nvim-lua/plenary.nvim',
    },
    lazy = true,
    init = function()
      conf.register_plugin_name('neogit')
    end,
    config = function()
      require(config_path('neogit')).setup()
    end,
  },

  {
    'stevearc/overseer.nvim',
    lazy = true,
    init = function()
      conf.register_plugin_name('overseer')
    end,
    config = function()
      require(config_path('overseer')).setup()
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python',
      'nvim-neotest/nvim-nio',
    },
    lazy = true,
    init = function()
      conf.register_plugin_name('nvim-dap')
    end,
    config = function()
      require(config_path('nvim-dap')).setup()
    end,
  },

  {
    'debugloop/telescope-undo.nvim',
    dependencies = 'nvim-telescope/telescope.nvim',
    lazy = true,
    init = function()
      conf.register_plugin_name('telescope-undo')
    end,
    config = function()
      require(config_path('telescope-undo')).setup()
    end,
  },

  {
    'michaelb/sniprun',
    build = 'sh ./install.sh',
    lazy = true,
    init = function()
      conf.register_plugin_name('sniprun')
    end,
    config = function()
      require(config_path('sniprun')).setup()
    end,
  },

  {
    'nvim-neotest/neotest',
    dependencies = {
      'haydenmeade/neotest-jest',
      'alfaix/neotest-gtest',
      'nvim-neotest/neotest-python',
      'nvim-treesitter/nvim-treesitter',
      'nvim-lua/plenary.nvim',
    },
    lazy = true,
    init = function()
      conf.register_plugin_name('neotest')
    end,
    config = function()
      require(config_path('neotest')).setup()
    end,
  },

  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    config = true,
    init = function()
      conf.register_plugin_name('persistence')
    end,
  },

  {
    'linux-cultist/venv-selector.nvim',
    branch = 'regexp',
    lazy = true,
    init = function()
      conf.register_plugin_name('venv-selector')
    end,
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-telescope/telescope.nvim',
      'mfussenegger/nvim-dap-python',
    },
    config = function()
      require(config_path('venv-selector')).setup()
    end,
  },
}
