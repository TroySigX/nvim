local M = {}

function M.keymaps()
  local map = require('utils.keymaps').add_keymap
  require('which-key').add({ '<space>c', group = 'Crates' })
  map({
    '<space>ct',
    function()
      require('crates').toggle()
    end,
    '[c]rates [t]oggle UI',
  })
  map({
    '<space>cu',
    function()
      require('crates').upgrade_crate()
    end,
    '[c]rates [u]pgrade',
  })
  map({
    '<space>cU',
    function()
      require('crates').upgrade_all_crates()
    end,
    '[c]rates [U]pgrade All',
  })
  map({
    '<space>cd',
    function()
      require('crates').open_documentation()
    end,
    '[c]rates [d]ocs',
  })

  map({
    '<space>cu',
    function()
      require('crates').upgrade_crates()
    end,
    '[c]rates [u]pgrade',
    mode = 'x',
  })
end

function M.setup()
  require('crates').setup({
    lsp = {
      enabled = true,
      actions = true,
      completion = true,
    },
  })
end

return M
