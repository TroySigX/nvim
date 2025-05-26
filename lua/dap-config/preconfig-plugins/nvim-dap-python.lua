local M = {}

function M.setup()
  local dap = require('dap')
  local path = require('utils.path')

  local mason_registry = require('mason-registry')
  if not mason_registry.is_installed('debugpy') then
    return
  end

  local debugpy_path = vim.fn.expand('$MASON/packages/debugpy')
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
