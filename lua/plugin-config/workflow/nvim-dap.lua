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
    ['<leader>'] = {
      d = {
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
  }, { prefix = '<leader>', mode = { 'n', 'v' } })
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
  local ft_to_adapter = {
    c = 'codelldb',
    cpp = 'codelldb',
    rust = 'codelldb',
    javascript = 'js-debug-adapter',
    typescript = 'js-debug-adapter',
  }

  local config_plugins = {
    'nvim-dap-python',
  }

  -- setup adapters
  local dap = require('dap')
  local adapter_to_ft = {}
  for ft, adapter in pairs(ft_to_adapter) do
    dap.configurations[ft] = require('dap-config.adapters.' .. adapter).adapter()

    if not adapter_to_ft[adapter] then
      adapter_to_ft[adapter] = {}
    end
    table.insert(adapter_to_ft[adapter], ft)
  end

  -- call predefined dap configurations
  for _, config in pairs(config_plugins) do
    require('dap-config.preconfig-plugins.' .. config).setup()
  end

  -- local project settings
  require('dap.ext.vscode').load_launchjs(nil, adapter_to_ft)
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
        size = 0.28,
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
        size = 0.3,
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
    d = {
      name = 'debugger',
      b = {
        function()
          require('dap').toggle_breakpoint()
          require('dapui')
        end,
        'Toggle [B]reakpoint',
      },
    },
  }, { prefix = '<leader>' })

  wk.register({
    ['<F8>'] = {
      function()
        vim.cmd.stopinsert()
        require('dapui').toggle({
          reset = true,
        })
      end,
      'Toggle DapUI (debugger)',
    },
  }, { mode = { 'n', 'i', 'v' } })
end

return M
