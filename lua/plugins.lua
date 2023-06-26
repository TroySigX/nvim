return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-cmdline',
      'zbirenbaum/copilot.lua',
      'zbirenbaum/copilot-cmp',
      'onsails/lspkind.nvim',
    },
    config = function()
      require('plugin-config.nvim-cmp')
      require('plugin-config.luasnip')
    end,
  },

  {
    'nvimdev/lspsaga.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-treesitter/nvim-treesitter',
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
    },
    config = function()
      require('plugin-config.lsp-setup')
    end,
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('plugin-config.which-key')
    end,
  },

  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    config = function()
      require('plugin-config.comment')
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'rcarriga/nvim-notify',
      {
        'folke/noice.nvim',
        dependencies = 'MunifTanjim/nui.nvim',
      },
    },
    config = function()
      require('plugin-config.notify')
      require('plugin-config.noice')
      require('plugin-config.lualine')
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    cmd = 'ToggleTerm',
    config = function()
      require('plugin-config.toggleterm')
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    config = function()
      require('plugin-config.nvim-tree')
    end,
  },

  {
    'nvimdev/dashboard-nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugin-config.dashboard')
    end,
  },

  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
  },

  {
    'preservim/tagbar',
    cmd = 'TagbarToggle',
    config = function()
      require('plugin-config.tagbar')
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugin-config.indent')
    end
  },

  {
    'folke/tokyonight.nvim',
    config = function()
      require('plugin-config.colorscheme')
    end,
  },

  {
    'HiPhish/nvim-ts-rainbow2',
    event = 'VeryLazy',
    config = function ()
      require('plugin-config.ts-rainbow')
    end,
  },

  {
    'danymat/neogen',
    lazy = true,
    config = function()
      require('plugin-config.neogen')
    end,
  },

  {
    'tyru/open-browser.vim',
    event = 'VeryLazy',
  },

  {
    'jiangmiao/auto-pairs',
  },

  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    cmd = 'TroubleToggle',
    config = function()
      require('plugin-config.trouble')
    end,
  },

  {
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('plugin-config.todo-comments')
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    build = ':TSUpdate',
    config = function()
      require('plugin-config.treesitter')
    end,
  },

  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugin-config.bufferline')
    end,
  },

  {
    'frabjous/knap',
    lazy = true,
    config = function()
      require('plugin-config.knap')
    end,
  },

  {
    'ibhagwan/fzf-lua',
    dependencies = {
      {
        'junegunn/fzf',
        build = './install --bin',
      },
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('plugin-config.fzf-lua')
    end,
  },

  {
    'mfussenegger/nvim-lint',
    event = 'BufWritePost',
    config = function()
      require('plugin-config.nvim-lint')
    end,
  },

  {
    'TimUntersberger/neogit',
    dependencies = {
      'sindrets/diffview.nvim',
      'nvim-lua/plenary.nvim'
    },
    lazy = true,
    config = function()
      require('plugin-config.neogit')
    end,
  },

  {
    'karb94/neoscroll.nvim',
    event = 'VeryLazy',
    keys = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
    '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    config = function()
      require('plugin-config.neoscroll')
    end,
  },

  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Neorg',
    config = function()
      require('plugin-config.neorg')
    end,
  },

  {
    'echasnovski/mini.move',
    keys = {
      { '<A-h>', mode = { 'n', 'v' } },
      { '<A-j>', mode = { 'n', 'v' } },
      { '<A-k>', mode = { 'n', 'v' } },
      { '<A-l>', mode = { 'n', 'v' } },
    },
    config = function()
      require('plugin-config.mini-move')
    end,
  },

  {
    'Wansmer/treesj',
    lazy = true,
    config = function()
      require('plugin-config.treesj')
    end
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python',
    },
    lazy = true,
    config = function()
      require('plugin-config.nvim-dap')
    end,
  },

  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
  },

  {
    'michaelb/sniprun',
    build = 'sh ./install.sh',
    cmd = {
      'SnipRun',
      'SnipClose',
    },
    config = function()
      require('plugin-config.sniprun')
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
      require('plugin-config.neotest')
    end,
  },

  {
    'mrjones2014/smart-splits.nvim',
    keys = {
      { '<A-H>', mode = { 'n', 'i', 'v' } },
      { '<A-J>', mode = { 'n', 'i', 'v' } },
      { '<A-K>', mode = { 'n', 'i', 'v' } },
      { '<A-L>', mode = { 'n', 'i', 'v' } },
      '<leader><leader>h',
      '<leader><leader>j',
      '<leader><leader>k',
      '<leader><leader>l',
    },
    config = function()
      require('plugin-config.smart-splits')
    end,
  },

  {
    'AckslD/muren.nvim',
    lazy = true,
    config = function()
      require('plugin-config.muren')
    end,
  },

  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function()
      require('plugin-config.nvim-surround')
    end,
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
      'nvim-treesitter/nvim-treesitter',
      'luukvbaal/statuscol.nvim',
    },
    config = function()
      require('plugin-config.nvim-ufo')
    end,
  },

  {
    'tpope/vim-dadbod',
    cmd = {
      'DBUIToggle',
      'DBUIFindBuffer',
      'DBUIRenameBuffer',
      'DBUILastQueryInfo',
    },
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
    },
    config = function()
      require('plugin-config.dadbod')
    end,
  },

  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    lazy = true,
    config = function()
      require('plugin-config.competitest')
    end,
  },

  {
    'glacambre/firenvim',

    cond = not not vim.g.started_by_firenvim,
    build = function()
      require('lazy').load({ plugins = 'firenvim', wait = true })
      vim.fn['firenvim#install'](0)
    end,
    config = function()
      require('plugin-config.firenvim')
    end,
  },
}
