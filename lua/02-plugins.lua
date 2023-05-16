local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
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
    },
    config = function()
      require('config.nvim-cmp')
      require('config.luasnip')
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = 'williamboman/mason.nvim',
    config = function()
      require('config.mason')
    end,
  },

  {
    'glepnir/lspsaga.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-treesitter/nvim-treesitter'
    },
    config = function()
      require('config.lsp-setup')
    end,
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('config.comment')
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
      require('config.notify')
      require('config.noice')
      require('config.lualine')
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    keys = {
      { '<F9>', mode = { 'n', 'i', 'v' } },
    },
    config = function()
      require('config.toggleterm')
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    keys = {
      { '<F2>', mode = { 'n', 'i', 'v' } },
    },
    config = function()
      require('config.nvim-tree')
    end,
  },

  {
    'glepnir/dashboard-nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('config.dashboard')
    end,
  },

  {
    'ggandor/leap.nvim',
    config = function()
      require('config.leap-nvim')
    end,
  },

  {
    'simrat39/symbols-outline.nvim',
    keys = {
      { '<F5>', mode = { 'n', 'i', 'v' } },
    },
    config = function()
      require('config.symbols-outline')
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('config.indent')
    end
  },

  {
    'folke/tokyonight.nvim',
    config = function()
      require('config.colorscheme')
    end,
  },

  {
    'HiPhish/nvim-ts-rainbow2',
    config = function ()
      require('config.ts-rainbow')
    end,
  },

  {
    'danymat/neogen',
    keys = '<space>ng',
    config = function()
      require('config.neogen')
    end,
  },

  {
    'tyru/open-browser.vim',
    keys = {
      { 'gx', mode = { 'n', 'v' } },
    },
    config = function()
      require('config.open-browser')
    end,
  },

  'jiangmiao/auto-pairs',

  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
      { '<F1>', mode = { 'n', 'i', 'v' } },
      '<leader>e', '<C-k>', '<C-j>',
    },
    config = function()
      require('config.trouble')
    end,
  },

  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
  },

  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('config.todo-comments')
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('config.treesitter')
    end,
  },

  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('config.bufferline')
    end,
  },

  {
    'frabjous/knap',
    keys = '<space>pr',
    config = function()
      require('config.knap')
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
      require('config.fzf-lua')
    end,
  },

  {
    'mfussenegger/nvim-lint',
    config = function()
      require('config.nvim-lint')
    end,
  },

  {
    'TimUntersberger/neogit',
    dependencies = {
      'sindrets/diffview.nvim',
      'nvim-lua/plenary.nvim'
    },
    keys = {
      { '<F10>', mode = { 'n', 'i', 'v' } },
    },
    config = function()
      require('config.neogit')
    end,
  },

  {
    'karb94/neoscroll.nvim',
    keys = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    config = function()
      require('config.neoscroll')
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
      require('config.mini-move')
    end,
  },

  {
    'echasnovski/mini.splitjoin',
    keys = {
      { 'gs', mode = { 'n', 'v' } },
    },
    config = function()
      require('config.mini-splitjoin')
    end
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    keys = {
      { '<F8>', mode = { 'n', 'i', 'v' } },
      '<leader>b',
    },
    config = function()
      require('config.nvim-dap')
    end,
  },

  {
    'mbbill/undotree',
    keys = '<F7>',
    config = function()
      require('config.undotree')
    end,
  },

  {
    'michaelb/sniprun',
    build = 'bash ./install.sh',
    keys = {
      { '<space>sr', mode = { 'n', 'v' } },
    },
    config = function()
      require('config.sniprun')
    end,
  },

  {
    'nvim-neotest/neotest',
    dependencies = {
      'haydenmeade/neotest-jest',
      'nvim-treesitter/nvim-treesitter',
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<F4>', mode = { 'n', 'i', 'v' } },
      '<leader>t', '<leader>at',
    },
    config = function()
      require('config.neotest')
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
      require('config.smart-splits')
    end,
  },

  {
    'AckslD/muren.nvim',
    key = {
      { '<C-s>', mode = { 'n', 'v' } },
    },
    config = function()
      require('config.muren')
    end,
  },

  {
    'kylechui/nvim-surround',
    config = function()
      require('config.nvim-surround')
    end,
  },

  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    keys = {
      '<space>tdt',
      '<space>tdc',
      '<space>tdp',
      '<space>ta',
      '<space>te',
      '<space>to',
      '<space>tr',
    },
    config = function()
      require('config.competitest')
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
      require('config.firenvim')
    end,
  },
})
