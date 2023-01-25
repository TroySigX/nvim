local dap = require('dap')
dap.adapters.codelldb = {
    type = 'server',
    host = '127.0.0.1',
    port = 13000,
    executable = {
        command = '/usr/bin/codelldb',
        args = {"--port", "13000"},
    }
}

dap.configurations.c = {
    {
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
        end,
        --program = '${fileDirname}/${fileBasenameNoExtension}',
        cwd = '${workspaceFolder}',
        terminal = 'integrated',
        stopOnEntry = false,
    }
}

dap.configurations.cpp = dap.configurations.c
local map = vim.keymap.set

require('dapui').setup()

map('n', '<leader>b', require('dap').toggle_breakpoint, { desc = 'Toggle [B]reakpoint' })
map('n', '<F8>', require('dapui').toggle, { desc = 'Toggle DapUI' })
map('i', '<F8>', require('dapui').toggle, { desc = 'Toggle DapUI' })
map('v', '<F8>', require('dapui').toggle, { desc = 'Toggle DapUI' })
