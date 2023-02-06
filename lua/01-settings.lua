vim.o.nocompatible = true
vim.o.termguicolors = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.mouse = 'a'
vim.o.splitright = true
vim.o.splitbelow = true
vim.opt.clipboard:append('unnamedplus')
vim.o.signcolumn = 'yes'
vim.o.syntax = 'on'

vim.o.encoding = 'UTF-8'
vim.o.showmatch = true
vim.o.nobackup = true
vim.o.updatetime = 300


-- moving between tabs
local map = vim.keymap.set
map('n', '<F7>', 'gt')
map('i', '<F7>', '<Esc>gt')
map('v', '<F7>', '<Esc>gt')
map('n', '<F19>', 'gT')
map('i', '<F19>', '<Esc>gT')
map('v', '<F19>', '<Esc>gT')

map('n', '<leader>1', '1gt')
map('n', '<leader>2', '2gt')
map('n', '<leader>3', '3gt')
map('n', '<leader>4', '4gt')
map('n', '<leader>5', '5gt')
map('n', '<leader>6', '6gt')
map('n', '<leader>7', '7gt')
map('n', '<leader>8', '8gt')
map('n', '<leader>9', '9gt')
map('n', '<leader>0', ':tablast<CR>')

-- insert new line without entering insert mode
map('n', 'nl', 'm`o<Esc>``', { desc = 'Insering new line below without entering insert mode' })
map('n', 'NL', 'm`O<Esc>``', { desc = 'Inserting new line above without entering insert mode' })

-- open link
map('n', 'gx', ":silent execute '!xdg-open ' .. shellescape(expand('<cfile>'))<CR>", { desc = 'open link', silent = true })

vim.diagnostic.config({
    virtual_text = false,
    signs = { severity = vim.diagnostic.severity.ERROR }
})

vim.cmd([[
    filetype on
    filetype plugin on
    filetype indent on

    "abbreviations
    autocmd Filetype java :ab deprint System.out.print();
    autocmd Filetype java :ab deprintln System.out.println();
    autocmd Filetype python :ab main$ if __name__ == '__main__':

    "template
    autocmd Filetype cpp :nnoremap <space>t :-1read $HOME/.config/nvim/templates/contest/main.cpp<CR>:133<CR>i<Tab>
    autocmd Filetype cpp :nnoremap <space>m :-1read $HOME/.config/nvim/templates/main/main.cpp<CR>:6<CR>i<Tab>
    autocmd Filetype java :nnoremap <space>t :-1read $HOME/.config/nvim/templates/contest/Main.java<CR>:24<CR>i<Tab><Tab><Tab>
    autocmd Filetype java :nnoremap <space>m :-1read $HOME/.config/nvim/templates/main/Main.java<CR>:3<CR>i<Tab><Tab>
]])
