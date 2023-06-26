local M = {}

function M.setup()
  require('bufferline').setup{
    options = {
      mode = 'tabs',
      numbers = 'ordinal',
    }
  }
end

return M
