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
    'debugloop/telescope-undo.nvim',
    keys = require(config_path('telescope-undo')).keymaps(),
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
      'nvim-treesitter/nvim-treesitter',
    },
    lazy = true,
    config = function()
      require(config_path('neotest')).setup()
    end,
  },

  {
    'vuki656/package-info.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
      require(config_path('package-info')).setup()
    end,
  },

  {
    'pwntester/octo.nvim',
    keys = require(config_path('octo')).keymaps(),
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require(config_path('octo')).setup()
    end,
  },

  {
    'coffebar/neovim-project',
    event = 'VeryLazy',
    config = function()
      require(config_path('neovim-project')).setup()
    end,
    init = function()
      vim.opt.sessionoptions:append('globals')
    end,
    dependencies = {
      { 'Shatur/neovim-session-manager' },
    },
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
