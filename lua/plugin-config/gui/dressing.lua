local M = {}

function M.setup()
  require('dressing').setup({
    select = {
      backend = { 'fzf_lua' },
    }
  })
end

return M
