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
    config = function()
      require(config_path('undotree')).setup()
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
    },
    lazy = true,
    config = function()
      require(config_path('neotest')).setup()
    end,
  },

  {
    'luk400/vim-jukit',
    lazy = true,
  },

  {
    'vuki656/package-info.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
      require(config_path('package-info')).setup()
    end,
  },

  {
    'linux-cultist/venv-selector.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim' },
    keys = require(config_path('venv-selector')).keymaps(),
    config = function()
      require(config_path('venv-selector')).setup()
    end,
  },
}
