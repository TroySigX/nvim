local M = {}

function M.keymaps()
  return {
    {
      '<leader>vs',
      ':VenvSelect<CR>',
      silent = true,
      desc = 'Select Virtual Environment',
      mode = { 'n', 'x' },
    },
    {
      '<leader>vc',
      ':VenvSelectCached<CR>',
      silent = true,
      desc = 'Select Cached Virtual Environment',
      mode = { 'n', 'x' },
    },
  }
end

function M.setup()
  require('venv-selector').setup({
    settings = {
      options = {
        enable_cached_venvs = true,
        cached_venv_automatic_activation = false,
        telescope_filter_type = 'character',
        notify_user_on_venv_activation = true,
      },
    },
  })
end

return M
