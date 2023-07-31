local M = {}

local wk = require('which-key')

local function on_attach_keymaps()
  wk.register({
    ['<A-Right>'] = {
      function()
        require('dap').step_over()
      end,
      'Debugger Step Over',
    },
    ['<A-Left>'] = {
      function()
        require('dap').step_back()
      end,
      'Debugger Step Back',
    },
    ['<A-Down>'] = {
      function()
        require('dap').step_into()
      end,
      'Debugger Step Back',
    },
    ['<A-Up>'] = {
      function()
        require('dap').step_out()
      end,
      'Debugger Step Out',
    },
    ['<space>'] = {
      d = {
        name = 'debugger',
        x = {
          function()
            require('dap').terminate()
          end,
          'Terminate Debugger',
        },
        h = {
          function()
            require('dap.ui.widgets').hover()
          end,
          'Debugger Hover Variables',
        },
        R = {
          function()
            require('dap').run_to_cursor()
          end,
          'Debugger Run to Cursor',
        },
        c = {
          function()
            require('dap').continue()
          end,
          'Launch debugger session',
        },
      },
    },
  })

  wk.register({
    d = {
      e = {
        function()
          require('dapui').eval()
        end,
        'Debugger Eval',
      },
    },
  }, { prefix = '<space>', mode = { 'n', 'v' } })
end

local function sign_define()
  vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
  vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
  vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
  local dap_breakpoint = {
    breakpoint = {
      text = '•',
      texthl = 'DapBreakpoint',
      linehl = '',
      numhl = '',
    },
    rejected = {
      text = '•',
      texthl = 'DapBreakpoint',
      linehl = '',
      numhl = '',
    },
    stopped = {
      text = '',
      texthl = 'LspDiagnosticsSignInformation',
      linehl = '',
      numhl = '',
    },
  }

  vim.fn.sign_define('DapBreakpoint', dap_breakpoint.breakpoint)
  vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)
  vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
end

local function ui_automation()
  local dap, dapui = require('dap'), require('dapui')

  dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
  end
end

local function debugger_setup()
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
end

local function dapui_setup()
  require('dapui').setup({
    layouts = {
      {
        elements = {
          {
            id = 'scopes',
            size = 0.25,
          },
          {
            id = 'watches',
            size = 0.25,
          },
          {
            id = 'breakpoints',
            size = 0.25,
          },
          {
            id = 'stacks',
            size = 0.25,
          },
        },
        position = 'left',
        size = 40,
      },
      {
        elements = {
          {
            id = 'repl',
            size = 0.5,
          },
          {
            id = 'console',
            size = 0.5,
          },
        },
        position = 'bottom',
        size = 10,
      },
    },
  })
end

function M.setup()
  debugger_setup()
  dapui_setup()
  on_attach_keymaps()
  ui_automation()
  sign_define()
end

function M.keymaps()
  wk.register({
    ['<leader>b'] = {
      function()
        require('dap').toggle_breakpoint()
        require('dapui')
      end,
      'Toggle [B]reakpoint',
    },
  })

  wk.register({
    ['<F8>'] = {
      function()
        require('dapui').toggle()
      end,
      'Toggle DapUI (debugger)',
    },
  }, { mode = { 'n', 'i', 'v' } })
end

return M
