local base_dir = 'plugin-config.workflow.'

local function config_path(plugin_name)
  return base_dir .. plugin_name
end

return {
  {
    'akinsho/toggleterm.nvim',
    keys = require(config_path('toggleterm')).keymaps(),
    config = function()
      require(config_path('toggleterm')).setup()
    end,
  },

  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = 'VeryLazy',
    config = function()
      require(config_path('todo-comments')).setup()
    end,
  },

  {
    'frabjous/knap',
    lazy = true,
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
    config = function()
      require(config_path('neogit')).setup()
    end,
  },

  {
    'stevearc/overseer.nvim',
    keys = require(config_path('overseer')).keymaps(),
    config = function()
      require(config_path('overseer')).setup()
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python',
    },
    lazy = true,
    config = function()
      require(config_path('nvim-dap')).setup()
    end,
  },

  {
    'debugloop/telescope-undo.nvim',
    dependencies = 'nvim-telescope/telescope.nvim',
    lazy = true,
    config = function()
      require(config_path('telescope-undo')).setup()
    end,
  },

  {
    'michaelb/sniprun',
    build = 'sh ./install.sh',
    keys = require(config_path('sniprun')).keymaps(),
    config = function()
      require(config_path('sniprun')).setup()
    end,
  },

  {
    'nvim-neotest/neotest',
    dependencies = {
      'haydenmeade/neotest-jest',
      'alfaix/neotest-gtest',
      'nvim-treesitter/nvim-treesitter',
      'nvim-lua/plenary.nvim',
    },
    lazy = true,
    config = function()
      require(config_path('neotest')).setup()
    end,
  },

  {
    'vuki656/package-info.nvim',
    event = {
      'BufRead package.json',
    },
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
      require(config_path('package-info')).setup()
    end,
  },

  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    config = true,
  },

  {
    'saecki/crates.nvim',
    event = {
      'BufRead Cargo.toml',
    },
    config = function()
      require(config_path('crates')).setup()
    end,
  },

  {
    'linux-cultist/venv-selector.nvim',
    lazy = true,
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require(config_path('venv-selector')).setup()
    end,
  },
}
