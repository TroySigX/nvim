local M = {}

function M.setup()
  require('mason-nvim-dap').setup({
    ensure_installed = { 'codelldb', 'debugpy', 'js' },
    handlers = {
      function(config)
        require('mason-nvim-dap').default_setup(config)
      end,
      python = require('dap-config.python').setup,
    },
  })
  require('dap-config.js').setup()
  require('dapui').setup()
end

function M.keymaps()
  require('which-key').register({
    ['<leader>b'] = {
      function()
        require('dap').toggle_breakpoint()
      end,
      'Toggle [B]reakpoint',
    },
  })

  require('which-key').register({
    ['<F8>'] = {
      function()
        require('dapui').toggle()
      end,
      'Toggle DapUI (debugger)',
    },
  }, { mode = { 'n', 'i', 'v' } })
end

return M
