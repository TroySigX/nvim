local opt = vim.opt
opt.termguicolors = true
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = 'a'
opt.splitright = true
opt.splitbelow = true
opt.clipboard:append('unnamedplus')
opt.signcolumn = 'yes'
opt.syntax = 'on'
opt.showmatch = true
opt.updatetime = 300
opt.list = true

vim.o.nocompatible = true
vim.o.nobackup = true

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
map('n', '<space>nl', 'm`o<Esc>``', { desc = 'Insering new line below without entering insert mode' })
map('n', '<space>NL', 'm`O<Esc>``', { desc = 'Inserting new line above without entering insert mode' })

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
vim.cmd[[
  filetype plugin indent on
]]