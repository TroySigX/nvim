local M = {}

function M.setup()
  local dap = require('dap')

  dap.adapters.codelldb = {
    type = 'server',
    host = '127.0.0.1',
    port = 13000,
    executable = {
      command = os.getenv('HOME') .. '/.local/share/nvim/mason/bin/codelldb',
      args = {'--port', '13000'},
    }
  }

  dap.configurations.c = {
    {
      type = 'codelldb',
      request = 'launch',
      program = vim.fn.getcwd() .. '/a.out',
      cwd = '${workspaceFolder}',
      terminal = 'integrated',
      stopOnEntry = false,
    }
  }

  dap.configurations.cpp = dap.configurations.c
end

return M
