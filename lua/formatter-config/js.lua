local M = {}

local path = require('lspconfig.util').path

function M.formatter_name()
  local name = '.prettierrc'
  return {
    name = name,
    path = path.join(vim.fn.stdpath('config'), 'lua', 'formatter-config', 'defaults', name),
  }
end

return M
