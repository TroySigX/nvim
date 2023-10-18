local M = {}

local path = require('globals.path')

function M.formatter()
  local config_file = '.prettierrc'
  return {
    mason_name = 'prettierd',
    conform_name = 'prettierd',
    config_file_name = config_file,
    config_file_path = path.join(vim.fn.stdpath('config'), 'lua', 'formatter-config', 'defaults', config_file),
  }
end

return M
