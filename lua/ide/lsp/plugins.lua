local config_path = require('utils.path').config_dir('lsp')
local conf = require(config_path())

return {
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'rafamadriz/friendly-snippets',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-cmdline',
      'zbirenbaum/copilot.lua',
      'zbirenbaum/copilot-cmp',
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-emoji',
    },
    init = function()
      conf.register_keymap('luasnip')
    end,
    config = function()
      require(config_path('nvim-cmp')).setup()
      require(config_path('luasnip')).setup()
    end,
  },

  {
    'neovim/nvim-lspconfig',
    priority = 150,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'mrcjkb/rustaceanvim',
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
      'pmizio/typescript-tools.nvim',
      'folke/lazydev.nvim',
    },
    config = function()
      require(config_path('lsp-setup')).setup()
    end,
  },

  -- FIXME: keymap not registered
  {
    'nvimdev/lspsaga.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-treesitter/nvim-treesitter',
    },
    init = function()
      conf.register_keymap('lspsaga')
    end,
    config = function()
      require(config_path('lspsaga')).setup()
    end,
  },

  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-lua/plenary.nvim',
    },
    lazy = true,
    init = function()
      conf.register_keymap('refactoring')
    end,
    config = function()
      require(config_path('refactoring')).setup()
    end,
  },

  {
    'mfussenegger/nvim-lint',
    lazy = true,
    init = function()
      conf.register_keymap('nvim-lint')
    end,
    config = function()
      require(config_path('nvim-lint')).setup()
    end,
  },

  {
    'CKolkey/ts-node-action',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    lazy = true,
    init = function()
      conf.register_keymap('ts-node-action')
    end,
  },

  {
    'folke/trouble.nvim',
    lazy = true,
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function()
      conf.register_keymap('trouble')
    end,
    config = function()
      require(config_path('trouble')).setup()
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require(config_path('treesitter')).setup()
    end,
  },
}
