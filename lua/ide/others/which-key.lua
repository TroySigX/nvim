local M = {}

function M.setup()
  require('which-key').setup({
    triggers_blacklist = {
      n = { 'v', "'" },
    },
  })
end

return M
