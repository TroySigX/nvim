local M = {}

local dap = require('dap')
local path_sep = require('plenary.path').path.sep

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
      cwd = '${workspaceFolder}',
      program = function()
        local co = coroutine.running()
        vim.ui.input({
          prompt = 'Path to executable: ',
          default = vim.fn.getcwd() .. path_sep,
        }, function(input)
          coroutine.resume(co, input)
        end)

        return coroutine.yield()
      end,
      terminal = 'integrated',
      stopOnEntry = false,
    },
  }
end

return M
