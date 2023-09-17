local M = {}

local path = require('lspconfig.util').path

function M.formatter()
  return {
    mason_name = 'latexindent',
    conform_name = 'latexindent',
  }
end

return M
