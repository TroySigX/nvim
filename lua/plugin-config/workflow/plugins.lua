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
    event = 'VeryLazy',
    dependencies = 'nvim-lua/plenary.nvim',
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
      'nvim-lua/plenary.nvim'
    },
    lazy = true,
    config = function()
      require(config_path('neogit')).setup()
    end,
  },

  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = require(config_path('neorg')).keymaps(),
    config = function()
      require(config_path('neorg')).setup()
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
      'jay-babu/mason-nvim-dap.nvim',
    },
    lazy = true,
    config = function()
      require(config_path('nvim-dap')).setup()
    end,
  },

  {
    'mbbill/undotree',
    keys = require(config_path('undotree')).keymaps(),
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
      'nvim-treesitter/nvim-treesitter',
      'nvim-lua/plenary.nvim',
    },
    lazy = true,
    config = function()
      require(config_path('neotest')).setup()
    end,
  },

  {
    'mrjones2014/smart-splits.nvim',
    lazy = true,
    config = function()
      require(config_path('smart-splits')).setup()
    end,
  },
}