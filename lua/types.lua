---@alias IDECapability 'editing' | 'explorer' | 'gui' | 'navigation' | 'others' | 'workflow' | 'lsp'

---@class Formatter
---@field mason_name? string
---@field system_name? string system package
---@field plugin_name string conform name
---@field config_file_name? string
---@field config_file_path? string

---@class IDEKeymapUtil
---@field config_path function
---@field register_plugin_name function(plugin_name: string)
---@field setup_keymaps function
---@field add_keymap_setup_function function
---@field [string] any
