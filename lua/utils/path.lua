local M = {}

local lsp_path = function()
  return require('lspconfig.util').path
end

--- path to plugin config file
--- example: 'ide.lsp.treesitter'
---@param base_dir IDECapability | 'lsp.lsp-setup'
---@return function (plugin_name: string): string
function M.config_dir(base_dir)
  local base_path = 'ide.' .. base_dir
  return function(plugin_name)
    return base_path .. (plugin_name == nil and '' or '.' .. plugin_name)
  end
end

function M.join(...)
  return lsp_path().join({ ... })
end

--- os path separator
function M.sep()
  return require('plenary.path').path.sep
end

--- get working dir of file
function M.path_dir(path)
  return lsp_path().dirname(path)
end

--- get working dir of buffer
function M.buf_dir(buf_id)
  local dir
  if
    not pcall(function() -- buffer is not file
      dir = M.path_dir(vim.api.nvim_buf_get_name(buf_id))
    end)
  then
    return nil
  end

  return dir
end

return M
