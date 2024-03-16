local opt = vim.opt
opt.termguicolors = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.ignorecase = true
opt.showmode = false
opt.smartcase = true
opt.mouse = 'a'
opt.splitright = true
opt.splitbelow = true
opt.clipboard:append('unnamedplus')
opt.signcolumn = 'yes'
opt.syntax = 'on'
opt.showmatch = true
opt.updatetime = 250
opt.list = true
opt.cursorline = true
opt.exrc = true

vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- default filetype for latex is tex
vim.g.tex_flavor = 'latex'

-- disable filetypes
vim.g.exclude_filetypes = {
  'lspinfo',
  'packer',
  'checkhealth',
  'help',
  'man',
  'dashboard',
  '',
  'NvimTree',
  'NeogitStatus',
  'Trouble',
  'aerial',
  'dap-repl',
  'dapui_console',
  'dapui_scopes',
  'dapui_watches',
  'dapui_breakpoints',
  'dapui_stacks',
  'qf',
  'neotest-summary',
}
