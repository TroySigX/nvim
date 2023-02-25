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
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        }
    },

    'numToStr/Comment.nvim',

    'akinsho/toggleterm.nvim',

    'nvim-tree/nvim-tree.lua',

    {
        'glepnir/dashboard-nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    'preservim/tagbar',

    'lukas-reineke/indent-blankline.nvim',

    'sainnhe/gruvbox-material',

    'tyru/open-browser.vim',

    'jiangmiao/auto-pairs',

    'mfussenegger/nvim-dap',

    {
        'folke/trouble.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    'dstein64/vim-startuptime',

    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    'nathom/filetype.nvim',

    'frabjous/knap',

    'williamboman/mason.nvim',

    {
        'junegunn/fzf',
        build = './install --bin',
    },

    {
        'ibhagwan/fzf-lua',
        dependencies = {
            'junegunn/fzf',
            'nvim-tree/nvim-web-devicons',
        }
    },

    'mfussenegger/nvim-lint',

    {
        'rcarriga/nvim-dap-ui',
        dependencies = 'mfussenegger/nvim-dap'
    },

    {
        'TimUntersberger/neogit',
        dependencies = {
            'sindrets/diffview.nvim',
            'nvim-lua/plenary.nvim'
        }
    },

    'karb94/neoscroll.nvim',

    {
        'subnut/nvim-ghost.nvim',
        build = ':call nvim_ghost#installer#install()'
    },

    'ggandor/leap.nvim',

    {
        'jackMort/ChatGPT.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        }
    },
})
