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
      adapter = {
        type = 'server',
        port = '${port}',
        host = '127.0.0.1',
        executable = {
          command = 'codelldb',
          args = { '--port', '${port}' },
        },
      },
    },
  })
end

return M
