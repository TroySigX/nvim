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
map({ 'v', 'i' }, '<F7>', '<Esc>gt')
map('n', '<F19>', 'gT')
map({ 'v', 'i' }, '<F19>', '<Esc>gT')

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
map({ 'n', 'v' }, 'gx', '<Plug>(openbrowser-smart-search)', { desc = 'open link' })

vim.diagnostic.config({
    virtual_text = false,
    signs = { severity = vim.diagnostic.severity.ERROR }
})

local autocmd = vim.api.nvim_create_autocmd

-- abbreviations 
autocmd("Filetype", { pattern = "java", command = [[ab deprint System.out.print();]] })
autocmd("Filetype", { pattern = "java", command = [[ab deprintln System.out.println();]] })
autocmd("Filetype", { pattern = "python", command = [[ab main$ if __name__ == '__main__':]] })

-- templates
autocmd("Filetype", { pattern = "cpp", command = [[nnoremap <space>t :-1read $HOME/.config/nvim/templates/contest/main.cpp<CR>:133<CR>i<Tab>]] })
autocmd("Filetype", { pattern = "cpp", command = [[nnoremap <space>m :-1read $HOME/.config/nvim/templates/main/main.cpp<CR>:6<CR>i<Tab>]] })
autocmd("Filetype", { pattern = "java", command = [[nnoremap <space>m :-1read $HOME/.config/nvim/templates/main/Main.java<CR>:3<CR>i<Tab><Tab>]] })

-- enable filetype detection
vim.cmd([[
    filetype plugin indent on
]])
