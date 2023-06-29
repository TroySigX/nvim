local M = {}

function M.setup()
  require('dap-config.init')
  require('dapui').setup()
end

function M.keymaps()
  require('which-key').register({
    ['<leader>b'] = { require('dap').toggle_breakpoint, 'Toggle [B]reakpoint' },
  })

  require('which-key').register({
    ['<F8>'] = { require('dapui').toggle, 'Toggle DapUI' },
  }, { mode = { 'n', 'i', 'v' } })
end

return M
