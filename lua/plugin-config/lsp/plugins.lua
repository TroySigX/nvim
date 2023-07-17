local lsp_config_path = 'plugin-config.lsp.'

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
    },
    config = function()
      require(lsp_config_path .. 'nvim-cmp').setup()
      require(lsp_config_path .. 'luasnip').setup()
    end,
  },

  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-tree/nvim-web-devicons',
      'nvim-treesitter/nvim-treesitter',
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
      'pmizio/typescript-tools.nvim',
      'simrat39/rust-tools.nvim',
    },
    config = function()
      require(lsp_config_path .. 'lsp-setup').setup()
      require(lsp_config_path .. 'typescript-tools').setup()
      require(lsp_config_path .. 'rust-tools').setup()
    end,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require(lsp_config_path .. 'null-ls').setup()
    end,
  },

  {
    'folke/trouble.nvim',
    keys = require(lsp_config_path .. 'trouble').keymaps(),
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require(lsp_config_path .. 'trouble').setup()
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require(lsp_config_path .. 'treesitter').setup()
    end,
  },
}
