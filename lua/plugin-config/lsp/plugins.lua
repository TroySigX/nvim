local base_dir = 'plugin-config.lsp.'

local function config_path(plugin_name)
  return base_dir .. plugin_name
end

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
      'lukas-reineke/cmp-under-comparator',
    },
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

  {
    'nvimdev/lspsaga.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-treesitter/nvim-treesitter',
    },
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
    config = function()
      require(config_path('refactoring')).setup()
    end,
  },

  {
    'mfussenegger/nvim-lint',
    lazy = true,
    config = function()
      require(config_path('nvim-lint')).setup()
    end,
  },

  {
    'CKolkey/ts-node-action',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    lazy = true,
  },

  {
    'folke/trouble.nvim',
    lazy = true,
    dependencies = 'nvim-tree/nvim-web-devicons',
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
