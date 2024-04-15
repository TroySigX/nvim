local M = {}

local cmd = require('utils.cmd')
local formatter_install_cache = {}
local cache_renew_time = 60

local function query_cache(formatter_name)
  if formatter_install_cache[formatter_name] == nil then
    return false
  end

  local current_time = os.time()
  if current_time - formatter_install_cache[formatter_name].last_updated > cache_renew_time then
    return false
  end

  return formatter_install_cache[formatter_name].installed
end

function M.formatter_installed_name(formatter)
  if formatter == nil then
    return nil
  end

  if formatter.mason_name ~= nil then
    if query_cache(formatter.mason_name) then
      return formatter.mason_name
    end

    formatter_install_cache[formatter.mason_name] = {
      last_updated = os.time(),
      installed = require('mason-registry').is_installed(formatter.mason_name),
    }

    if formatter_install_cache[formatter.mason_name].installed then
      return formatter.mason_name
    end
  end

  if formatter.system_name ~= nil then
    if query_cache(formatter.system_name) then
      return formatter.system_name
    end

    formatter_install_cache[formatter.system_name] = {
      last_updated = os.time(),
      installed = cmd.run_cmd(formatter.system_name .. ' --version').status == 0,
    }

    if formatter_install_cache[formatter.system_name].installed then
      return formatter.system_name
    end
  end

  return nil
end

-- table mapping filetypes with their respective
-- file name in the formatter-config directory
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
  }
end

return M
