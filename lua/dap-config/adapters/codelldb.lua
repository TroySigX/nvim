local M = {}

local dap = require('dap')
local cache = {} -- last executable for file

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
      name = 'Launch file',
      type = 'codelldb',
      request = 'launch',
      cwd = '${workspaceFolder}',
      program = function()
        local cur_file = vim.fn.expand('%:p')
        local files = {}
        for file in require('utils.cmd').run_cmd('fd -I').output:gmatch('[^\r\n]+') do
          if file == cache[cur_file] then
            table.insert(files, 1, file)
          else
            table.insert(files, file)
          end
        end
        local executable = require('utils.user_input').select('Select executable: ', files)
        if executable == nil then
          return
        end
        cache[cur_file] = executable

        return executable
      end,
      terminal = 'integrated',
      stopOnEntry = false,
    },
  }
end

return M
