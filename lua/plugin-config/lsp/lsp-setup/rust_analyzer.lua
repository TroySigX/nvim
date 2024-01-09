local M = {}

function M.setup(opts)
  vim.g.rustaceanvim = {
    server = {
      settings = {
        ['rust-analyzer'] = opts,
      },
    },
    dap = {
      adapters = false,
    },
  }
end

return M
