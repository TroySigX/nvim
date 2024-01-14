local M = {}

function M.setup()
  require('trouble').setup({
    use_diagnostic_signs = true,
  })
end

function M.keymaps()
  require('which-key').register({
    ['<F1>'] = {
      function()
        require('trouble').toggle()
      end,
      'Toggle Trouble (diagnostic) List',
    },
  }, { mode = { 'n', 'i', 'x' } })
end

return M
