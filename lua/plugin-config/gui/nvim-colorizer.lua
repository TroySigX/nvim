local M = {}

function M.keymaps()
  return {
    {
      '<space>ct',
      vim.cmd.ColorizerToggle,
      silent = true,
      desc = '[C]olorizer [T]oggle',
    },
  }
end

function M.setup()
  require('colorizer').setup({})
end

return M
