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
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-cmdline',
      'zbirenbaum/copilot.lua',
      'zbirenbaum/copilot-cmp',
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-emoji',
    },
    config = function()
      require(config_path('nvim-cmp')).setup()
      require(config_path('luasnip')).setup()
    end,
  },

  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'folke/neodev.nvim',
      'p00f/clangd_extensions.nvim',
      'neovim/nvim-lspconfig',
      'nvim-tree/nvim-web-devicons',
      'nvim-treesitter/nvim-treesitter',
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
      'simrat39/rust-tools.nvim',
    },
    config = function()
      -- neodev has to init before lspconfig
      require(config_path('neodev')).setup()
      require(config_path('clangd-extension')).setup()
      require(config_path('lsp-setup')).setup()
      require(config_path('rust-tools')).setup()
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
    build = ':TSUpdate',
    config = function()
      require(config_path('treesitter')).setup()
    end,
  },
}
