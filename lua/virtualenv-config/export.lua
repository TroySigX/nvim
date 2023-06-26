-- export venv variable to local config file

local M = {}
local path = require('lspconfig.util').path

function M.export(venv_var)
  if next(venv_var) then
    local file = io.open(path.join(vim.fn.getcwd(), '.nvim.lua'), 'a')
    if file == nil then
      return
    end
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
