local M = {}

local map = require('utils.keymaps').add_keymap

local function on_attach_keymaps()
  local dap = require('dap')
  map({
    '<A-Right>',
    dap.step_over,
    'Debugger Step Over',
  })
  map({
    '<A-Left>',
    dap.step_back,
    'Debugger Step Back',
  })
  map({
    '<A-Down>',
    dap.step_into,
    'Debugger Step Back',
  })
  map({
    '<A-Up>',
    dap.step_out,
    'Debugger Step Out',
  })

  map({
    '<leader>dx',
    dap.terminate,
    'Terminate Debugger',
  })
  map({
    '<leader>dr',
    dap.run_to_cursor,
    'Debugger Run to Cursor',
  })
  map({
    '<leader>dc',
    dap.run_last,
    'Run last debugger session',
  })
  map({
    '<leader>dC',
    dap.continue,
    'Launch debugger session',
  })

  map({
    '<leader>de',
    require('dapui').eval,
    'Debugger Eval',
    mode = { 'n', 'x' },
  })
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
  local ft_to_adapter = require('dap-config').ft_to_adapter()

  local config_plugins = require('dap-config').preconfig_plugins()

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
  sign_define()
  debugger_setup()
  dapui_setup()
  on_attach_keymaps()
  ui_automation()
end

function M.keymaps()
  require('which-key').add({ '<leader>d', group = 'debugger' })
  map({
    '<leader>db',
    function()
      require('dapui')
      require('dap').toggle_breakpoint()
    end,
    'Toggle [B]reakpoint',
  })

  map({
    '<F8>',
    function()
      vim.cmd.stopinsert()
      require('dapui').toggle({
        reset = true,
      })
    end,
    'Toggle DapUI (debugger)',
    mode = { 'n', 'i', 'x' },
  })
end

return M
