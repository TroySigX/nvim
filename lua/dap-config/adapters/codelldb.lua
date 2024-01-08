local M = {}

local dap = require('dap')
local cache_file = require('utils.path').join(vim.fn.stdpath('data'), 'codelldb_executable_cache.json')
local cache = {} -- last executable for file

-- load cache
local function load_cache()
  local file = io.open(cache_file, 'r')
  if file then
    local content = file:read('*a')
    cache = vim.fn.json_decode(content)
    io.close(file)
  end
end

load_cache()

-- setup adapter
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

        if cache[cur_file] ~= executable then
          cache[cur_file] = executable

          -- save cache
          local file = io.open(cache_file, 'w')
          if file then
            local content = vim.fn.json_encode(cache)
            file:write(content)
            io.close(file)
          end
        end

        return executable
      end,
      terminal = 'integrated',
      stopOnEntry = false,
    },
  }
end

return M
