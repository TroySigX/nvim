local M = {}

local path = require('globals.path')

function M.formatter(cwd)
  local config_file = '.rustfmt.toml'
  return {
    project_root = function()
      local cargo_path =
        require('globals.cmd').run_cmd('cd ' .. cwd .. ' && cargo locate-project --message-format plain').output
      return path.path_dir(cargo_path)
    end,
    system_name = 'rustfmt',
    conform_name = 'rustfmt',
    config_file_name = config_file,
    config_file_path = path.join(vim.fn.stdpath('config'), 'lua', 'formatter-config', 'defaults', config_file),
  }
end

return M
