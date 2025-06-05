local config_path = require('utils.path').config_dir('lsp')
local conf = require(config_path())

return {
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'rafamadriz/friendly-snippets',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-cmdline',
      'zbirenbaum/copilot.lua',
      'zbirenbaum/copilot-cmp',
      'onsails/lspkind.nvim',
    },
    init = function()
      conf.register_plugin_name('luasnip')
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
      'mason-org/mason-lspconfig.nvim',
      'mason-org/mason.nvim',
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
    init = function()
      conf.register_plugin_name('lspsaga')
    end,
    config = function()
      require(config_path('lspsaga')).setup()
    end,
  },

  {
    'stevearc/conform.nvim',
    lazy = true,
    event = 'BufWritePre',
    init = function()
      conf.register_plugin_name('conform')
    end,
    config = function()
      require(config_path('conform')).setup()
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
      conf.register_plugin_name('refactoring')
    end,
    config = function()
      require(config_path('refactoring')).setup()
    end,
  },

  {
    'mfussenegger/nvim-lint',
    lazy = true,
    init = function()
      conf.register_plugin_name('nvim-lint')
    end,
    config = function()
      require(config_path('nvim-lint')).setup()
    end,
  },

  -- { -- requires plugins in lua/plugins/treesitter.lua and lua/plugins/lsp.lua
  --   -- for complete functionality (language features)
  --   'quarto-dev/quarto-nvim',
  --   ft = { 'quarto', 'markdown' },
  --   opts = {
  --     lspFeatures = {
  --       languages = { 'r', 'python', 'rust' },
  --       chunks = 'all',
  --       diagnostics = {
  --         enabled = true,
  --         triggers = { 'BufWritePost' },
  --       },
  --       completion = {
  --         enabled = true,
  --       },
  --     },
  --     keymap = false,
  --     codeRunner = {
  --       enabled = true,
  --       default_method = 'molten',
  --     },
  --   },
  --   dependencies = {
  --     'hrsh7th/nvim-cmp',
  --     'jmbuhr/otter.nvim',
  --   },
  -- },
  --
  -- {
  --   'jmbuhr/otter.nvim',
  --   lazy = true,
  --   opts = {
  --     hover = {
  --       border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
  --     },
  --   },
  -- },
  -- {
  --   -- see the image.nvim readme for more information about configuring this plugin
  --   '3rd/image.nvim',
  --   opts = {
  --     backend = 'kitty', -- whatever backend you would like to use
  --     max_width = 100,
  --     max_height = 12,
  --     max_height_window_percentage = math.huge,
  --     max_width_window_percentage = math.huge,
  --     window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
  --     window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
  --   },
  -- },

  -- {
  --   'benlubas/molten-nvim',
  --   version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
  --   build = ':UpdateRemotePlugins',
  --   init = function()
  --     -- vim.g.molten_image_provider = 'image.nvim'
  --     vim.g.molten_output_win_max_height = 12
  --     vim.g.molten_virt_text_output = true
  --     vim.g.molten_virt_lines_off_by_1 = true
  --     vim.g.molten_virt_text_max_lines = 1
  --     vim.keymap.set('n', '<leader>mi', ':MoltenInit<CR>', { silent = true, desc = 'Molten Init Kernel' })
  --     vim.keymap.set('n', '<leader>ml', ':MoltenEvaluateLine<CR>', { silent = true, desc = 'Molten Evaluate Line' })
  --     vim.keymap.set(
  --       'v',
  --       '<leader>mv',
  --       ':<C-u>MoltenEvaluateVisual<CR>gv<ESC>',
  --       { silent = true, desc = 'Molten Evaluate Visual' }
  --     )
  --     vim.keymap.set('n', '<leader>mh', ':MoltenHideOutput<CR>', { silent = true, desc = 'Molten Hide Output' })
  --     vim.keymap.set(
  --       'n',
  --       '<leader>mo',
  --       ':noautocmd MoltenEnterOutput<CR>',
  --       { silent = true, desc = 'Molten Enter Output' }
  --     )
  --   end,
  -- },
  --
  -- {
  --   'GCBallesteros/jupytext.nvim',
  --   opts = {
  --     style = 'markdown',
  --     output_extension = 'md',
  --     force_ft = 'markdown',
  --   },
  -- },

  {
    'CKolkey/ts-node-action',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    lazy = true,
    init = function()
      conf.register_plugin_name('ts-node-action')
    end,
  },

  {
    'folke/trouble.nvim',
    lazy = true,
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function()
      conf.register_plugin_name('trouble')
    end,
    config = function()
      require(config_path('trouble')).setup()
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    branch = 'master',
    config = function()
      require(config_path('treesitter')).setup()
    end,
  },
}
