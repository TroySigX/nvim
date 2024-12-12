local M = {}

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

-- join path
function M.join(...)
  return vim.fs.joinpath(...)
end

--- get working dir of file
function M.dirname(path)
  return vim.fs.dirname(path)
end

--- get working dir of buffer
function M.buf_dir(buf_id)
  local dir
  if
    not pcall(function() -- buffer is not file
      dir = M.dirname(vim.api.nvim_buf_get_name(buf_id))
    end)
  then
    return nil
  end

  return dir
end

return M
