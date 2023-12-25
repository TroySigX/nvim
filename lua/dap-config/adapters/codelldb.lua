local M = {}

local dap = require('dap')
local path = require('utils.path')
local path_sep = path.sep()
local file_to_executable = {} -- save last executable for file
local luarocks_installed = false -- only call nvim_rocks once

dap.adapters.codelldb = {
  type = 'server',
  host = '127.0.0.1',
  port = '${port}',
  executable = {
    command = 'codelldb',
    args = { '--port', '${port}' },
  },
}

local function is_executable(filepath)
  -- checking if file exists
  if not path.exists(filepath) then
    return false
  end

  local lfs = require('lfs')
  local attr = lfs.attributes(filepath)
  if string.match(attr.permissions, 'x') then
    return true
  end
  return false
end

function M.adapter()
  return {
    {
      type = 'codelldb',
      request = 'launch',
      cwd = '${workspaceFolder}',
      program = function()
        local filepath = vim.fn.expand('%:p')
        local executable = require('utils.user_input').input(
          'Path to executable: ',
          file_to_executable[filepath] or vim.fn.getcwd() .. path_sep
        )

        -- saving executable for file
        if not luarocks_installed then
          require('nvim_rocks').ensure_installed('luafilesystem')
          luarocks_installed = true
        end
        if is_executable(executable) then
          file_to_executable[filepath] = executable
        end

        return executable
      end,
      terminal = 'integrated',
      stopOnEntry = false,
    },
  }
end

return M
