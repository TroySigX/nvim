local M = {}

local path = require('utils.path')

function M.formatter(cwd)
  local config_file = '.prettierrc'
  return {
    project_root = function()
      local npm_path = require('utils.cmd').run_cmd('cd ' .. cwd .. ' && npm root').output
      return path.path_dir(npm_path)
    end,
    mason_name = 'prettierd',
    conform_name = 'prettierd',
    config_file_name = config_file,
    config_file_path = path.join(vim.fn.stdpath('config'), 'lua', 'formatter-config', 'defaults', config_file),
  }
end

return M
