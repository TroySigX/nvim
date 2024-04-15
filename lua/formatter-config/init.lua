local M = {}

local cmd = require('utils.cmd')

function M.formatter_installed_name(formatter)
  if formatter == nil then
    return nil
  end

  if formatter.mason_name ~= nil then
    if require('mason-registry').is_installed(formatter.mason_name) then
      return formatter.mason_name
    end
  end

  if formatter.system_name ~= nil then
    if cmd.run_cmd(formatter.system_name .. ' --version').status == 0 then
      return formatter.system_name
    end
  end

  return nil
end

-- table mapping filetypes with their respective
-- file name in the formatter-config directory
function M.filetypes()
  return {
    lua = 'lua',
    c = 'c',
    cpp = 'c',
    rust = 'rust',
    typescript = 'js',
    javascript = 'js',
    python = 'python',
    tex = 'tex',
    typst = 'typ',
  }
end

return M
