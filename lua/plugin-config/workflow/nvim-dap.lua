local M = {}

function M.setup()
  require('dap-config.init')
  require('dapui').setup()
end

function M.keymaps()
  require('which-key').register({
    ['<leader>b'] = { function() require('dap').toggle_breakpoint() end, 'Toggle [B]reakpoint' },
  })

  require('which-key').register({
    ['<F8>'] = { function() require('dapui').toggle() end, 'Toggle DapUI' },
  }, { mode = { 'n', 'i', 'v' } })
end

return M
