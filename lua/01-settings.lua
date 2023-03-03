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
vim.o.list = true

-- default filetype for latex is tex
vim.g.tex_flavor = 'latex'

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
map('n', '<space>n', 'm`o<Esc>``', { desc = 'Insering new line below without entering insert mode' })
map('n', '<space>N', 'm`O<Esc>``', { desc = 'Inserting new line above without entering insert mode' })

-- set signs
local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
}
for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })

end

-- diagnostic severity
vim.diagnostic.config({
    virtual_text = false,
    signs = { severity = vim.diagnostic.severity.ERROR }
})

-- enable filetype detection
vim.cmd([[
    filetype plugin indent on
]])
