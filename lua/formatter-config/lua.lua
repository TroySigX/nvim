local M = {}

local path = require('lspconfig.util').path

function M.formatter_name()
  local name = 'stylua.toml'
  return {
    name = name,
    path = path.join(vim.fn.stdpath('config'), name),
  }
end

return M
