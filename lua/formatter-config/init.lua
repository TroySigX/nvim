local M = {}

local cmd = require('utils.cmd')

function M.formatter_installed(formatter)
  if formatter == nil then
    return false
  end

  if formatter.mason_name ~= nil then
    if require('mason-registry').is_installed(formatter.mason_name) then
      return true
    end
  elseif formatter.system_name ~= nil then
    if cmd.run_cmd(formatter.system_name .. ' --version').status == 0 then
      return true
    end
  end

  return false
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
