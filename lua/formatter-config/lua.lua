local M = {}

local path = require('lspconfig.util').path

function M.formatter()
  local config_file = 'stylua.toml'
  return {
    formatter_name = 'stylua',
    config_file_name = config_file,
    path = path.join(vim.fn.stdpath('config'), config_file),
  }
end

return M
