local M = {}

--- setup keymaps for plugins
---@param ide_capability IDECapability
---@return table {config_path = function(), register = function(plugin_name: string), setup = function()}
function M.new(ide_capability)
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

return M
