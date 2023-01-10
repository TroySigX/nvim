return require('packer').startup(function(use)
    use 'nvim-tree/nvim-tree.lua'

    use 'preservim/tagbar'

    use 'sainnhe/gruvbox-material'

    use 'jiangmiao/auto-pairs'

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

    -- use 'sheerun/vim-polyglot'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use 'nathom/filetype.nvim'

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
        'lervag/vimtex',
        ft = 'tex'
    }

    use {
        'xuhdev/vim-latex-live-preview',
        ft = 'tex'
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        }
    }
end)
