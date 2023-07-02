local M = {}

function M.keymaps()
  return {
    { 'gx', '<Plug>(openbrowser-smart-search)', desc = 'Search on web', mode = { 'n', 'v' } },
  }
end

return M
