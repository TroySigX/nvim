local M = {}

function M.keymaps()
  return {
    {
      '<leader>vs',
      vim.cmd.VenvSelect,
      silent = true,
      desc = 'Select Virtual Environment',
    },
    {
      '<leader>vc',
      vim.cmd.VenvSelectCached,
      silent = true,
      desc = 'Select Cached Virtual Environment',
    },
  }
end

function M.setup()
  require('venv-selector').setup({
    auto_refresh = true,
    dap_enabled = true,
    parents = 0,
    name = { 'venv', '.venv' },
  })
end

return M
