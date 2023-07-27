local M = {}

function M.setup()
  require('neodev').setup({
    override = function()
      -- diagnostic severity
      vim.diagnostic.config({
        signs = { severity = vim.diagnostic.severity.ERROR },
        underline = { severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.INFO } },
      })
    end,
  })
end

return M
