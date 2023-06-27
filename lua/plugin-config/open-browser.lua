local M = {}

function M.keymaps()
  return {
    { 'gx', '<Plug>(openbrowser-smart-search)', desc = 'Open link', mode = { 'n', 'v' } },
  }
end

return M
