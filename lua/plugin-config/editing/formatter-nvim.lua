local M = {}

function M.keymaps()
  return {
    { '<space>lf', vim.cmd.Format, silent = true, desc = '[L]sp [F]ormat Code', mode = { 'n', 'v' } },
  }
end

function M.setup()
  require('formatter').setup({
    filetype = {
      lua = {
        require('formatter.filetypes.lua').stylua,
      },
      typescript = {
        require('formatter.filetypes.typescript').prettierd,
      },
      javascript = {
        require('formatter.filetypes.javascript').prettierd,
      },
      python = {
        require('formatter.filetypes.python').black,
      },
      cpp = {
        require('formatter.filetypes.python').clangformat,
      },
      c = {
        require('formatter.filetypes.python').clangformat,
      },
    },
  })

  vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = '*',
    callback = function()
      vim.cmd([[FormatWriteLock]])
    end,
  })
end

return M
