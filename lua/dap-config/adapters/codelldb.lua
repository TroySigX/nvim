local M = {}

local dap = require('dap')

dap.adapters.codelldb = {
  type = 'server',
  host = '127.0.0.1',
  port = '${port}',
  executable = {
    command = 'codelldb',
    args = { '--port', '${port}' },
  },
}

function M.adapter()
  return {
    {
      type = 'codelldb',
      request = 'launch',
      -- program = vim.fn.getcwd() .. '/a.out',
      cwd = '${workspaceFolder}',
      terminal = 'integrated',
      stopOnEntry = false,
    },
  }
end

return M
