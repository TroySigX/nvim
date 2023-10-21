local M = {}

function M.setup(opts)
  require('rust-tools').setup({
    tools = {
      executor = require('rust-tools.executors').toggleterm,
    },
    server = opts,
    dap = {
      adapter = require('dap-config.adapters.codelldb').adapter,
    },
  })
end

return M
