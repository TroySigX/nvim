require('dap-config.cpp')
require('dap-config.py')

require('dapui').setup()

local map = vim.keymap.set
map('n', '<leader>b', require('dap').toggle_breakpoint, { desc = 'Toggle [B]reakpoint' })
map({ 'n', 'i', 'v' }, '<F8>', require('dapui').toggle, { desc = 'Toggle DapUI' })
