local M = {}

function M.setup(capabilities)
  require('rust-tools').setup({
    tools = {
      executor = require('rust-tools.executors').toggleterm,
    },
    server = {
      capabilities = capabilities,
    },
    dap = {
      adapter = require('dap-config.adapters.codelldb').adapter,
    },
  })
end

return M
