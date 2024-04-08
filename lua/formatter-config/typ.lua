local M = {}

local path = require('utils.path')

function M.formatter()
  local config_file = 'typstfmt.toml'
  return {
    mason_name = 'typstfmt',
    conform_name = 'typstfmt',
    config_file_name = config_file,
    config_file_path = path.join(vim.fn.stdpath('config'), 'lua', 'formatter-config', 'defaults', config_file),
  }
end

return M
