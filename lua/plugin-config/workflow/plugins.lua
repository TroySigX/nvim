local workflow_config_path = 'plugin-config.workflow.'

return {
  {
    'akinsho/toggleterm.nvim',
    keys = require(workflow_config_path .. 'toggleterm').keymaps(),
    config = function()
      require(workflow_config_path .. 'toggleterm').setup()
    end,
  },

  {
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require(workflow_config_path .. 'todo-comments').setup()
    end,
  },

  {
    'frabjous/knap',
    lazy = true,
    config = function()
      require(workflow_config_path .. 'knap').setup()
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
      require(workflow_config_path .. 'neogit').setup()
    end,
  },

  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = require(workflow_config_path .. 'neorg').keymaps(),
    config = function()
      require(workflow_config_path .. 'neorg').setup()
    end,
  },

  {
    'stevearc/overseer.nvim',
    keys = require(workflow_config_path .. 'overseer').keymaps(),
    config = function()
      require(workflow_config_path .. 'overseer').setup()
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
      require(workflow_config_path .. 'nvim-dap').setup()
    end,
  },

  {
    'mbbill/undotree',
    keys = require(workflow_config_path .. 'undotree').keymaps(),
  },

  {
    'michaelb/sniprun',
    build = 'sh ./install.sh',
    keys = require(workflow_config_path .. 'sniprun').keymaps(),
    config = function()
      require(workflow_config_path .. 'sniprun').setup()
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
      require(workflow_config_path .. 'neotest').setup()
    end,
  },

  {
    'mrjones2014/smart-splits.nvim',
    lazy = true,
    config = function()
      require(workflow_config_path .. 'smart-splits').setup()
    end,
  },
}
