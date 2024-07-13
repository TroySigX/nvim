local M = {}

local plugin_keymaps = require('utils.keymaps').create_capability_keymaps('workflow')

function M.register_keymap(plugin_name)
  plugin_keymaps.register(plugin_name)
end

function M.setup_keymap()
  -- plugin-specific keymaps
  plugin_keymaps.setup()
end

function M.active_venv()
  local pyproject = vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
  if pyproject == '' then
    return ''
  end

  local venv = require('venv-selector').venv()
  if venv then
    local max_len = 30
    local venv_parts = vim.fn.split(venv, '/')
    local venv_name = venv_parts[#venv_parts]
    local venv_name_len = venv_name:len()
    venv_name = venv_name_len > max_len
        and venv_name:sub(1, max_len - 3 - 6) .. '...' .. venv_name:sub(venv_name_len - (6 - 1), venv_name_len)
      or venv_name
    return venv_name
  else
    return 'No Active Venv'
  end
end

return M
