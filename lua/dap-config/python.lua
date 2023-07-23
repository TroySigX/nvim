local M = {}

function M.setup()
  local dap = require('dap')
  local path = require('lspconfig.util').path

  local mason_registry = require('mason-registry')
  local debugpy_path = mason_registry.get_package('debugpy'):get_install_path()
  require('dap-python').setup(path.join(debugpy_path, 'venv', 'bin', 'python'))

  table.insert(dap.configurations.python, {
    type = 'python',
    request = 'launch',
    name = 'Django',
    program = path.join(vim.fn.getcwd(), 'manage.py'),
    args = { 'runserver' },
  })
end

return M
