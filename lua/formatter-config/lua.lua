local M = {}

local path = require('utils.path')

---@return Formatter
function M.formatter()
  local config_file = '.stylua.toml'
  return {
    mason_name = 'stylua',
    plugin_name = 'stylua',
    config_file_name = config_file,
    config_file_path = path.join(vim.fn.stdpath('config'), config_file),
  }
end

return M
