return require('packer').startup(function(use)
    use 'lewis6991/impatient.nvim'

    use 'nvim-tree/nvim-tree.lua'

    use 'preservim/tagbar'

    use 'lukas-reineke/indent-blankline.nvim'

    use 'sainnhe/gruvbox-material'

    use 'tyru/open-browser.vim'

    use 'jiangmiao/auto-pairs'

    use 'mfussenegger/nvim-dap'

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    use { 'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use 'akinsho/toggleterm.nvim'

    use 'numToStr/Comment.nvim'

    use 'dstein64/vim-startuptime'

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use 'nathom/filetype.nvim'

    use 'frabjous/knap'

    use 'williamboman/mason.nvim'

    use {
        'junegunn/fzf',
        run = './install --bin',
    }

    use {
        'ibhagwan/fzf-lua',
        requires = 'nvim-tree/nvim-web-devicons',
    }

    use 'mfussenegger/nvim-lint'

    use {
        'rcarriga/nvim-dap-ui',
        requires = { 'mfussenegger/nvim-dap' }
    }

    use {
        'TimUntersberger/neogit',
        requires = {
            'sindrets/diffview.nvim',
            'nvim-lua/plenary.nvim'
        }
    }

    use 'karb94/neoscroll.nvim'

    use 'saadparwaiz1/cmp_luasnip'

    use 'L3MON4D3/LuaSnip'

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp-signature-help'
        }
    }
end)
