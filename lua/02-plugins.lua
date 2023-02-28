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
        },
        config = function()
            require('nvim-cmp-config')
        end,
    },

    {
        'williamboman/mason.nvim',
        config = function()
            require('mason-config')
        end,
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('comment-config')
        end,
    },

    {
        'akinsho/toggleterm.nvim',
        keys = '<F9>',
        config = function()
            require('toggleterm-config')
        end,
    },

    {
        'nvim-tree/nvim-tree.lua',
        keys = '<F2>',
        config = function()
            require('nvim-tree-config')
        end,
    },

    {
        'glepnir/dashboard-nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('dashboard-config')
        end,
    },

    {
        'ggandor/leap.nvim',
        config = function()
            require('leap-nvim-config')
        end,
    },

    {
        'preservim/tagbar',
        keys = '<F5>',
        config = function()
            require('tagbar-config')
        end,
    },

    'lukas-reineke/indent-blankline.nvim',

    {
        'sainnhe/gruvbox-material',
        config = function()
            require('colorscheme-config')
        end,
    },

    'tyru/open-browser.vim',

    'jiangmiao/auto-pairs',

    {
        'folke/trouble.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        keys = { '<F1>', '<leader>e', '<C-k>', '<C-j>' },
        config = function()
            require('trouble-config')
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('lualine-config')
        end,
    },

    'dstein64/vim-startuptime',

    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        keys = '<F3>',
        config = function()
            require('todo-comments-config')
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('treesitter-config')
        end,
    },

    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('bufferline-config')
        end,
    },

    {
        'frabjous/knap',
        keys = '<space>pr',
        config = function()
            require('knap-config')
        end,
    },

    {
        'junegunn/fzf',
        build = './install --bin',
    },

    {
        'ibhagwan/fzf-lua',
        dependencies = {
            'junegunn/fzf',
            'nvim-tree/nvim-web-devicons',
        },
        keys = { '<F6>', '<F18>', '<space>gr', '<space>sw', '<space>km' },
        config = function()
            require('fzf-lua-config')
        end,
    },

    {
        'mfussenegger/nvim-lint',
        config = function()
            require('nvim-lint-config')
        end,
    },

    {
        'rcarriga/nvim-dap-ui',
        dependencies = 'mfussenegger/nvim-dap',
        keys = { '<leader>b', '<F8>' },
        config = function()
            require('nvim-dap-config')
        end,
    },

    {
        'TimUntersberger/neogit',
        dependencies = {
            'sindrets/diffview.nvim',
            'nvim-lua/plenary.nvim'
        },
        keys = '<F10>',
        config = function()
            require('neogit-config')
        end,
    },

    {
        'nvim-neotest/neotest',
        dependencies = {
            'haydenmeade/neotest-jest',
            'nvim-treesitter/nvim-treesitter',
            'nvim-lua/plenary.nvim',
        },
        keys = { '<F4>', '<leader>t', '<leader>at' },
        config = function()
            require('neotest-config')
        end,
    },

    {
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll-config')
        end,
    },

    {
        'subnut/nvim-ghost.nvim',
        build = ':call nvim_ghost#installer#install()'
    },

    {
        'jackMort/ChatGPT.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        },
        keys = '<F11>',
        config = function()
            require('chatgpt-config')
        end,

    },
})
