local M = {}

function M.setup()
  require('dressing').setup({
    select = {
      backend = { 'telescope', 'fzf_lua' },
    },
  })
end

return M
