call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-tree/nvim-tree.lua'
Plug 'preservim/tagbar'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'windwp/nvim-autopairs'
Plug 'dense-analysis/ale'
Plug 'nvim-lualine/lualine.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'junegunn/fzf.vim'
Plug 'akinsho/toggleterm.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'dstein64/vim-startuptime'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'akinsho/bufferline.nvim'
Plug 'nathom/filetype.nvim'
" Plug 'mfussenegger/nvim-dap'

call plug#end()
