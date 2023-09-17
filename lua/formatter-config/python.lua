local M = {}

local path = require('lspconfig.util').path

function M.formatter()
  return {
    mason_name = 'black',
    conform_name = 'black',
  }
end

return M
