local M = {}

function M.setup()
  require('dap-vscode-js').setup({
    node_path = 'node',
    debugger_path = os.getenv('HOME') .. '/.local/share/nvim/lazy/vscode-js-debug',
    adapters = { 'pwa-node' },
  })
  for _, language in pairs { --[[ 'typescript', ]] 'javascript' } do
    require('dap').configurations[language] = {
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        cwd = '${workspaceFolder}',
      },
      {
        type = 'pwa-node',
        request = 'attach',
        name = 'Attach',
        processId = require('dap.utils').pick_process,
        cwd = '${workspaceFolder}',
      },
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Debug Jest Tests',
        -- trace = true, -- include debugger info
        runtimeExecutable = 'node',
        runtimeArgs = {
          './node_modules/jest/bin/jest.js',
          '--runInBand',
        },
        rootPath = '${workspaceFolder}',
        cwd = '${workspaceFolder}',
        console = 'integratedTerminal',
        internalConsoleOptions = 'neverOpen',
      },
    }
  end
end

return M
