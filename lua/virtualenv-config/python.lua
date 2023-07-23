local path = require('lspconfig.util').path

local function get_pipenv_dir()
  return vim.fn.trim(vim.fn.system('pipenv --venv'))
end

local function get_poetry_dir()
  return vim.fn.trim(vim.fn.system('poetry env info -p'))
end

local function get_python_dir()
  local workspace = vim.fn.getcwd()

  local poetry_match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
  if poetry_match ~= '' then
    return get_poetry_dir()
  end

  local pipenv_match = vim.fn.glob(path.join(workspace, 'Pipfile.lock'))
  if pipenv_match ~= '' then
    return get_pipenv_dir()
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ '*', '.*' }) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.dirname(match)
    end
  end

  return ''
end

local function py_bin_dir(venv)
  return path.join(venv, 'bin:')
end

local M = {}

function M.setup()
  local _virtual_env = ''

  if not vim.env.VIRTUAL_ENV or vim.env.VIRTUAL_ENV == '' then
    _virtual_env = get_python_dir()
  end

  if _virtual_env ~= '' then
    vim.env.VIRTUAL_ENV = _virtual_env
    vim.env.PATH = py_bin_dir(_virtual_env) .. vim.env.PATH
  end

  if _virtual_env ~= '' and vim.env.PYTHONHOME then
    vim.env.old_PYTHONHOME = vim.env.PYTHONHOME
    vim.env.PYTHONHOME = ''
  end

  -- export to local config
  local venv_var = {}
  if _virtual_env ~= '' then
    venv_var.assign = {
      VIRTUAL_ENV = _virtual_env,
    }
    venv_var.prepend = {
      PATH = py_bin_dir(_virtual_env),
    }
    if vim.env.PYTHONHOME then
      venv_var.assign.PYTHONHOME = vim.env.PYTHONHOME
    end
  end

  vim.schedule(function()
    require('virtualenv-config.export').export(venv_var)
  end)
end

return M
