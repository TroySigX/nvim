local M = {}

function M.keymaps()
  return {
    { '<space>oa', ':Octo actions<CR>', silent = true, desc = '[O]cto [A]ctions' },
  }
end

function M.setup()
  require('octo').setup()
end

return M
