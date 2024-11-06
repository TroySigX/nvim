local M = {}

function M.keymaps()
  local map = require('utils.keymaps').add_keymap
  map({
    '<leader>vs',
    function()
      require('venv-selector')
      vim.cmd.VenvSelect()
    end,
    'Select Virtual Environment',
  })
  map({
    '<leader>vc',
    function()
      require('venv-selector')
      vim.cmd.VenvSelectCached()
    end,
    'Select Cached Virtual Environment',
  })
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
      search = {
        my_venvs = {
          command = "$FD '/bin/python$' /mnt/HDD/.virtualenvs --full-path",
        },
      },
    },
  })
end

return M
