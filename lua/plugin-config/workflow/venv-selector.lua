local M = {}

function M.keymaps()
  require('which-key').register({
    vs = {
      function()
        require('venv-selector').open()
      end,
      'Select Virtual Environment',
    },
    vc = {
      function()
        require('venv-selector').retrieve_from_cache()
      end,
      'Select Virtual Environment',
    },
  }, { prefix = '<leader>' })
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
