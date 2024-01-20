local M = {}

function M.keymaps()
  require('which-key').register({
    c = {
      name = 'Crates',
      t = {
        function()
          require('crates').toggle()
        end,
        '[c]rates [t]oggle UI',
      },
      u = {
        function()
          require('crates').upgrade_crate()
        end,
        '[c]rates [u]pgrade',
      },
      U = {
        function()
          require('crates').upgrade_all_crates()
        end,
        '[c]rates [U]pgrade',
      },
      d = {
        function()
          require('crates').open_documentation()
        end,
        '[c]rates [d]ocs',
      },
    },
  }, { prefix = '<space>' })

  require('which-key').register({
    c = {
      u = {
        function()
          require('crates').upgrade_crates()
        end,
        '[c]rates [u]pgrade',
      },
    },
  }, { prefix = '<space>', mode = 'x' })
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
