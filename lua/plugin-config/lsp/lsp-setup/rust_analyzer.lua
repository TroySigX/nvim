local M = {}

function M.setup(opts)
  vim.g.rustaceanvim = {
    settings = {
      ['rust-analyzer'] = opts,
    },
  }
end

return M
