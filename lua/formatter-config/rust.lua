local M = {}

local path = require('utils.path')

function M.formatter(cwd)
  local config_file = '.rustfmt.toml'
  return {
    system_name = 'rustfmt',
    conform_name = 'rustfmt',
    config_file_name = config_file,
    config_file_path = path.join(vim.fn.stdpath('config'), 'lua', 'formatter-config', 'defaults', config_file),
  }
end

return M
