local path = require('lspconfig.util').path

local function get_pipenv_dir()
  return vim.fn.trim(vim.fn.system 'pipenv --venv')
end

local function get_poetry_dir()
  return vim.fn.trim(vim.fn.system 'poetry env info -p')
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
  for _, pattern in ipairs { '*', '.*' } do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.dirname(match)
    end
  end

  return ''
end

local _virtual_env = ''

local function py_bin_dir()
  return path.join(_virtual_env, 'bin:')
end

-- setup venv
if not vim.env.VIRTUAL_ENV or vim.env.VIRTUAL_ENV == '' then
  _virtual_env = get_python_dir()
end

if _virtual_env ~= '' then
  vim.env.VIRTUAL_ENV = _virtual_env
  vim.env.PATH = py_bin_dir() .. vim.env.PATH
end

if _virtual_env ~= '' and vim.env.PYTHONHOME then
  vim.env.old_PYTHONHOME = vim.env.PYTHONHOME
  vim.env.PYTHONHOME = ''
end
