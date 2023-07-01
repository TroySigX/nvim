-- export venv variable to local config file

local M = {}
local path = require('lspconfig.util').path

local function file_exists(file_path)
  local f=io.open(file_path,'r')
  if f~=nil then
      f:close()
      return true
  else
      return false
  end
end

function M.export(venv_var)
  if next(venv_var) then
    local file_path = path.join(vim.fn.getcwd(), '.nvim.lua')
    local f_exist = file_exists(file_path)
    local file = io.open(file_path, 'a')
    if file == nil then
      return
    end

    -- appended text needs to be on a newline
    if f_exist then
      file:write('\n')
    end

    -- append venv variables to file
    for var_type, type_table in pairs(venv_var) do
      if next(type_table) then
        for var, var_value in pairs(type_table) do
          file:write('vim.env.' .. var .. ' = ')
          local value = '\'' .. var_value .. '\''
          if var_type == 'assign' then
            file:write(value)
          elseif var_type == 'prepend' then
            file:write(value .. ' .. vim.env.' .. var)
          end
          file:write('\n')
        end
      end
    end
    file:close()
  end
end

return M
