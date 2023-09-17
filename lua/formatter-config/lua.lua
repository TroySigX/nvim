local M = {}

local path = require('lspconfig.util').path

function M.formatter()
  local config_file = 'stylua.toml'
  return {
    mason_name = 'stylua',
    conform_name = 'stylua',
    config_file_name = config_file,
    config_file_path = path.join(vim.fn.stdpath('config'), config_file),
  }
end

return M
