local M = {}

--- table mapping filetypes with their respective
--- debugger adapter name
function M.ft_to_adapter()
  return {
    c = 'codelldb',
    cpp = 'codelldb',
    rust = 'codelldb',
    javascript = 'js-debug-adapter',
    typescript = 'js-debug-adapter',
  }
end

--- list of plugins that configure dap adapter
function M.preconfig_plugins()
  return {
    'nvim-dap-python',
  }
end

return M
