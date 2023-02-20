return require('packer').startup(function(use)
    use 'lewis6991/impatient.nvim'

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        }
    }

    use 'numToStr/Comment.nvim'

    use 'akinsho/toggleterm.nvim'

    use 'nvim-tree/nvim-tree.lua'

    use {
        'glepnir/dashboard-nvim',
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use 'preservim/tagbar'

    use 'lukas-reineke/indent-blankline.nvim'

    use 'sainnhe/gruvbox-material'

    use 'tyru/open-browser.vim'

    use 'jiangmiao/auto-pairs'

    use 'mfussenegger/nvim-dap'

    use {
        'folke/trouble.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
    }

    use { 'nvim-lualine/lualine.nvim',
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use 'dstein64/vim-startuptime'

    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
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
        requires = {
            'junegunn/fzf',
            'nvim-tree/nvim-web-devicons',
        }
    }

    use 'mfussenegger/nvim-lint'

    use {
        'rcarriga/nvim-dap-ui',
        requires = 'mfussenegger/nvim-dap'
    }

    use {
        'TimUntersberger/neogit',
        requires = {
            'sindrets/diffview.nvim',
            'nvim-lua/plenary.nvim'
        }
    }

    use 'karb94/neoscroll.nvim'

    use {
        'subnut/nvim-ghost.nvim',
        run = ':call nvim_ghost#installer#install()'
    }

    use 'ggandor/leap.nvim'

    use{
        'jackMort/ChatGPT.nvim',
        requires = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        }
    }
end)
