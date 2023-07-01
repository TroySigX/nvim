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
      require('plugin-config.lsp.nvim-cmp').setup()
      require('plugin-config.lsp.luasnip').setup()
    end,
  },

  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-treesitter/nvim-treesitter',
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
    },
    config = function()
      require('plugin-config.lsp.lsp-setup').setup()
    end,
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('plugin-config.which-key').setup()
    end,
  },

  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    config = function()
      require('plugin-config.editing.comment').setup()
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
      require('plugin-config.gui.notify').setup()
      require('plugin-config.gui.noice').setup()
      require('plugin-config.gui.lualine').setup()
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    keys = require('plugin-config.workflow.toggleterm').keymaps(),
    config = function()
      require('plugin-config.workflow.toggleterm').setup()
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    config = function()
      require('plugin-config.explorer.nvim-tree').setup()
    end,
  },

  {
    'nvimdev/dashboard-nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugin-config.gui.dashboard').setup()
    end,
  },

  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
  },

  {
    'preservim/tagbar',
    keys = require('plugin-config.navigation.tagbar').keymaps(),
    config = function()
      require('plugin-config.navigation.tagbar').setup()
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugin-config.editing.indent').setup()
    end
  },

  {
    'folke/tokyonight.nvim',
    config = function()
      require('plugin-config.gui.colorscheme').setup()
    end,
  },

  {
    'HiPhish/nvim-ts-rainbow2',
    config = function ()
      require('plugin-config.editing.ts-rainbow').setup()
    end,
  },

  {
    'danymat/neogen',
    lazy = true,
    config = function()
      require('plugin-config.editing.neogen').setup()
    end,
  },

  {
    'tyru/open-browser.vim',
    keys = require('plugin-config.open-browser').keymaps(),
  },

  {
    'altermo/npairs-integrate-upair',
    event = 'InsertEnter',
    dependencies = {
      'windwp/nvim-autopairs',
      'altermo/ultimate-autopair.nvim',
      'RRethy/nvim-treesitter-endwise',
      'windwp/nvim-ts-autotag',
    },
    config= function()
      require('plugin-config.editing.autopairs').setup()
    end,
  },

  {
    'abecodes/tabout.nvim',
    event = 'InsertEnter',
    config = function()
      require('plugin-config.editing.tabout').setup()
    end,
  },

  {
    'folke/trouble.nvim',
    keys = require('plugin-config.lsp.trouble').keymaps(),
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugin-config.lsp.trouble').setup()
    end,
  },

  {
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('plugin-config.workflow.todo-comments').setup()
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('plugin-config.lsp.treesitter').setup()
    end,
  },

  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugin-config.gui.bufferline').setup()
    end,
  },

  {
    'frabjous/knap',
    lazy = true,
    config = function()
      require('plugin-config.workflow.knap').setup()
    end,
  },

  {
    'ibhagwan/fzf-lua',
    lazy = true,
    dependencies = {
      {
        'junegunn/fzf',
        build = './install --bin',
      },
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('plugin-config.explorer.fzf-lua').setup()
    end,
  },

  {
    'mfussenegger/nvim-lint',
    event = 'BufWritePost',
    config = function()
      require('plugin-config.lsp.nvim-lint')
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
      require('plugin-config.workflow.neogit').setup()
    end,
  },

  {
    'karb94/neoscroll.nvim',
    keys = require('plugin-config.navigation.neoscroll').keymaps({ 'desc' }),
    config = function()
      require('plugin-config.navigation.neoscroll').setup()
    end,
  },

  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = require('plugin-config.workflow.neorg').keymaps(),
    config = function()
      require('plugin-config.workflow.neorg').setup()
    end,
  },

  {
    'echasnovski/mini.move',
    keys = {
      { '<A-h>', mode = { 'n', 'v' }, desc = 'move text to the left' },
      { '<A-j>', mode = { 'n', 'v' }, desc = 'move text down 1 line' },
      { '<A-k>', mode = { 'n', 'v' }, desc = 'move text up 1 line' },
      { '<A-l>', mode = { 'n', 'v' }, desc = 'move text to the right' },
    },
    config = function()
      require('plugin-config.editing.mini-move').setup()
    end,
  },

  {
    'Wansmer/treesj',
    lazy = true,
    config = function()
      require('plugin-config.editing.treesj').setup()
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
      require('plugin-config.workflow.nvim-dap').setup()
    end,
  },

  {
    'mbbill/undotree',
    keys = require('plugin-config.workflow.undotree').keymaps(),
  },

  {
    'michaelb/sniprun',
    build = 'sh ./install.sh',
    keys = require('plugin-config.workflow.sniprun').keymaps(),
    config = function()
      require('plugin-config.workflow.sniprun').setup()
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
      require('plugin-config.workflow.neotest').setup()
    end,
  },

  {
    'mrjones2014/smart-splits.nvim',
    lazy = true,
    config = function()
      require('plugin-config.workflow.smart-splits').setup()
    end,
  },

  {
    'AckslD/muren.nvim',
    lazy = true,
    config = function()
      require('plugin-config.editing.muren').setup()
    end,
  },

  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function()
      require('plugin-config.editing.nvim-surround').setup()
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
      require('plugin-config.navigation.nvim-ufo').setup()
    end,
  },

  {
    'tpope/vim-dadbod',
    keys = require('plugin-config.dadbod').keymaps(),
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
    },
    config = function()
      require('plugin-config.dadbod').setup()
    end,
  },

  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    keys = require('plugin-config.competitest').keymaps(),
    config = function()
      require('plugin-config.competitest').setup()
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
      require('plugin-config.firenvim').setup()
    end,
  },
}
