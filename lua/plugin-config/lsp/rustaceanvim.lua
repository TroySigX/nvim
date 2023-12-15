local M = {}

function M.setup(opts)
  vim.g.rustaceanvim = {
    server = opts,
  }
end

return M
