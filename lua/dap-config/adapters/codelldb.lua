local M = {}

local dap = require('dap')
local path_sep = require('globals.path').sep()
local file_to_executable = {}

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
          default = file_to_executable[vim.fn.expand('%')] or vim.fn.getcwd() .. path_sep,
        }, function(input)
          coroutine.resume(co, input)
        end)

        local executable = coroutine.yield()
        file_to_executable[vim.fn.expand('%')] = executable
        return executable
      end,
      terminal = 'integrated',
      stopOnEntry = false,
    },
  }
end

return M
