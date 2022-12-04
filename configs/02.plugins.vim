call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary' 
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'dstein64/vim-startuptime'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim', {'branch' : 'neovim-pre-0.8.0'}
Plug 'sheerun/vim-polyglot'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.0*' }
Plug 'nathom/filetype.nvim'
" Plug 'mfussenegger/nvim-dap'

call plug#end()
