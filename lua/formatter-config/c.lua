local M = {}

local path = require('lspconfig.util').path

function M.formatter()
  local config_file = '.clang-format'
  return {
    mason_name = 'clang-format',
    conform_name = 'clang_format',
    config_file_name = config_file,
    config_file_path = path.join(vim.fn.stdpath('config'), 'lua', 'formatter-config', 'defaults', config_file),
  }
end

return M
