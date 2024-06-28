local config_path = require('utils.path').config_dir('workflow')
local conf = require(config_path())

return {
  {
    'akinsho/toggleterm.nvim',
    cmd = 'ToggleTermSetName',
    init = function()
      conf.register_keymap('toggleterm')
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
      conf.register_keymap('todo-comments')
    end,
    config = function()
      require(config_path('todo-comments')).setup()
    end,
  },

  {
    'frabjous/knap',
    lazy = true,
    init = function()
      conf.register_keymap('knap')
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
      conf.register_keymap('neogit')
    end,
    config = function()
      require(config_path('neogit')).setup()
    end,
  },

  {
    'stevearc/overseer.nvim',
    lazy = true,
    init = function()
      conf.register_keymap('overseer')
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
      conf.register_keymap('nvim-dap')
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
      conf.register_keymap('telescope-undo')
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
      conf.register_keymap('sniprun')
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
      conf.register_keymap('neotest')
    end,
    config = function()
      require(config_path('neotest')).setup()
    end,
  },

  {
    'vuki656/package-info.nvim',
    event = {
      'BufRead package.json',
    },
    init = function()
      conf.register_keymap('package-info')
    end,
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
      require(config_path('package-info')).setup()
    end,
  },

  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    config = true,
    init = function()
      conf.register_keymap('persistence')
    end,
  },

  {
    'saecki/crates.nvim',
    event = {
      'BufRead Cargo.toml',
    },
    init = function()
      conf.register_keymap('crates')
    end,
    config = function()
      require(config_path('crates')).setup()
    end,
  },

  {
    'linux-cultist/venv-selector.nvim',
    branch = 'regexp',
    lazy = true,
    init = function()
      conf.register_keymap('venv-selector')
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
