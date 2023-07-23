local M = {}

function M.setup()
  require('rust-tools').setup({
    tools = {
      executor = require('rust-tools.executors').toggleterm,
    },
  })
end

return M
