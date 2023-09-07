local base_dir = 'plugin-config.lsp.'

local function config_path(plugin_name)
  return base_dir .. plugin_name
end

return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
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
      {
        'jackieaskins/cmp-emmet',
        build = 'npm run release',
      },
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
      'folke/neodev.nvim',
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
      'simrat39/rust-tools.nvim',
      'pmizio/typescript-tools.nvim',
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
    lazy = true,
  },

  {
    'folke/trouble.nvim',
    keys = require(config_path('trouble')).keymaps(),
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require(config_path('trouble')).setup()
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    -- priority = 150,
    build = ':TSUpdate',
    config = function()
      require(config_path('treesitter')).setup()
    end,
  },
}
