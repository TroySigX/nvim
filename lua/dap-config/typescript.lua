local dap = require('dap')
require('dap-vscode-js').setup {
    node_path = 'node',
    debugger_cmd = { 'js-debug-adapter' },
    adapters = { 'pwa-node' },
}
for _, language in ipairs { 'typescript', 'javascript' } do
    dap.configurations[language] = {
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
