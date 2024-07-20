local M = {}

--- setup keymaps for ide capabilities
---@param ide_capability IDECapability
---@return IDEKeymapUtil
function M.create_capability_keymaps(ide_capability)
  local config_path = require('utils.path').config_dir(ide_capability)
  local plugin_names = {}
  local additional_keymap_set_functions = {}

  --- add plugin name to list, which will be setup later in setup_keymaps()
  ---@param plugin_name string
  local function register(plugin_name)
    if plugin_names[plugin_name] == nil then
      plugin_names[plugin_name] = true
    end
  end

  --- add additional function to setup keymaps, which will be combined and setup later in setup_keymaps()
  ---@param f function
  local function add_keymap_setup_function(f)
    table.insert(additional_keymap_set_functions, f)
  end

  local function setup()
    for plugin_name, _ in pairs(plugin_names) do
      require(config_path(plugin_name)).keymaps()
    end

    for _, f in pairs(additional_keymap_set_functions) do
      f()
    end
  end

  return {
    config_path = config_path,
    register_plugin_name = register,
    add_keymap_setup_function = add_keymap_setup_function,
    setup_keymaps = setup,
  }
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
  if keymap.opts.silent == nil then
    keymap.opts.silent = true
  end
  if keymap.opts.noremap == nil then
    keymap.opts.noremap = true
  end

  vim.keymap.set(keymap.mode, keymap[1], keymap[2], keymap.opts)
end

return M
