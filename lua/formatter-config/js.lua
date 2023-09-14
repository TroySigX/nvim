local M = {}

local path = require('lspconfig.util').path

function M.formatter()
  local config_file = '.prettierrc'
  return {
    formatter_name = 'prettierd',
    config_file_name = config_file,
    path = path.join(vim.fn.stdpath('config'), 'lua', 'formatter-config', 'defaults', config_file),
  }
end

return M
