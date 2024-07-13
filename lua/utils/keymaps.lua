local M = {}

--- setup keymaps for ide capabilities
---@param ide_capability IDECapability
---@return table {config_path = function(), register = function(plugin_name: string), setup = function()}
function M.create_capability_keymaps(ide_capability)
  local config_path = require('utils.path').config_dir(ide_capability)
  local plugin_names = {}

  local function register(plugin_name)
    if plugin_names[plugin_name] == nil then
      plugin_names[plugin_name] = true
    end
  end

  local function setup()
    for plugin_name, _ in pairs(plugin_names) do
      require(config_path(plugin_name)).keymaps()
    end
  end

  return { config_path = config_path, register = register, setup = setup }
end

--- wrapper for vim.keymap.set
---@param keymap table { [1]: lhs, [2]: rhs, [3](desc): string, mode?: string|table, opts?: table }
function M.add_keymap(keymap)
  if keymap.mode == nil then
    keymap.mode = 'n'
  end

  if keymap.opts == nil then
    keymap.opts = {}
  end

  keymap.opts.desc = keymap[3]

  vim.keymap.set(keymap.mode, keymap[1], keymap[2], keymap.opts)
end

return M
