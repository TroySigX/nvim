local M = {}

local dap = require('dap')
local path = require('utils.path')
local cache_file = require('utils.file').file(path.join(vim.fn.stdpath('data'), 'codelldb_executable_cache.json'))
local cache = {} -- last executable for file

-- load cache
local function load_cache()
  local read_res = cache_file.read()
  if read_res.status == 0 then
    cache = vim.fn.json_decode(read_res.content)
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
        local cwd = vim.fn.getcwd()
        for file in require('utils.cmd').run_cmd('fd -I').output:gmatch('[^\r\n]+') do
          if path.join(cwd, file) == cache[cur_file] then
            table.insert(files, 1, file)
          else
            table.insert(files, file)
          end
        end
        local executable = require('utils.user_input').select('Select executable: ', files)
        if executable == nil then
          return
        end

        local executable_abs = path.join(cwd, executable)
        if cache[cur_file] ~= executable_abs then
          cache[cur_file] = executable_abs

          -- save cache
          local content = vim.fn.json_encode(cache)
          cache_file.write(content)
        end

        return executable
      end,
      terminal = 'integrated',
      stopOnEntry = false,
    },
  }
end

return M
