local M = {}

function M.setup(capabilities)
  require('rust-tools').setup({
    tools = {
      executor = require('rust-tools.executors').toggleterm,
    },
    server = {
      capabilities = capabilities,
    },
  })
end

return M
