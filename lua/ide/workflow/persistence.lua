local M = {}

function M.keymaps()
  require('utils.keymaps').add_keymap({
    '<F7>',
    function()
      -- venv selection should be run before session restore
      local workflow_dir = require('utils.path').config_dir('workflow')()
      if require(workflow_dir).active_venv() ~= '' then
        vim.cmd.VenvSelectCached()
      end

      require('persistence').load()
    end,
    'Load last session',
    mode = { 'n', 'i', 'x' },
  })
end

return M
