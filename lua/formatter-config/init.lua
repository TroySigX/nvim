local M = {}

local cmd = require('utils.cmd')
local formatter_install_cache = { mason = {}, system = {} }
local cache_renew_time = 60

local cache_update_methods = {
  mason = function(formatter_name)
    return require('mason-registry').is_installed(formatter_name)
  end,
  system = function(formatter_name)
    return cmd.run_cmd(formatter_name .. ' --version').status == 0
  end,
}

--- check if formatter is installed and updated in cache less than a minute ago
---@param formatter_name string
---@param update_method 'mason' | 'system'
---@return boolean
local function query_cache(formatter_name, update_method)
  local current_time = os.time()

  -- update cache
  if
    formatter_install_cache[update_method][formatter_name] == nil
    or current_time - formatter_install_cache[update_method][formatter_name].last_updated > cache_renew_time
  then
    formatter_install_cache[update_method][formatter_name] = {
      last_updated = os.time(),
      installed = cache_update_methods[update_method](formatter_name),
    }
  end

  return formatter_install_cache[update_method][formatter_name].installed
end

--- returns formatter's name if installed, nil otherwise
---@param formatter Formatter
---@return string | nil
function M.formatter_installed_name(formatter)
  if formatter == nil then
    return nil
  end

  if formatter.mason_name ~= nil then
    if query_cache(formatter.mason_name, 'mason') then
      return formatter.mason_name
    end
  end

  if formatter.system_name ~= nil then
    if query_cache(formatter.system_name, 'system') then
      return formatter.system_name
    end
  end

  if formatter.plugin_name == 'injected' then
    return 'injected'
  end

  return nil
end

--- table mapping filetypes with their respective
--- file name in the formatter-config directory
function M.filetypes()
  return {
    lua = 'lua',
    c = 'c',
    cpp = 'c',
    rust = 'rust',
    typescript = 'js',
    javascript = 'js',
    python = 'python',
    tex = 'tex',
    typst = 'typ',
    markdown = 'quarto',
  }
end

return M
