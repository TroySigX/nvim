local M = {}

function M.keymaps()
  return {
    { 'gx', vim.cmd.URLOpenUnderCursor, desc = 'Open Link' },
  }
end

function M.setup()
  require('url-open').setup({})
end

return M
