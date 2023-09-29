local M = {}

function M.setup()
  require('ibl').setup({
    exclude = {
      filetypes = vim.g.exclude_filetypes,
    },

    scope = {
      enabled = false,
    },
  })
end

return M
